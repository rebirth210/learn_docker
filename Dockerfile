# syntax = docker/dockerfile:1

# このDockerfileは本番環境向けです。開発環境ではなく、実際にアプリを動かすためのイメージを作成します。
# 例: docker build -t my-app .
#     docker run -d -p 80:80 -p 443:443 --name my-app -e RAILS_MASTER_KEY=<config/master.key の値> my-app

# RUBY_VERSION は .ruby-version に書いてある Ruby のバージョンと合わせてください。
ARG RUBY_VERSION=3.2.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# Rails アプリを配置するディレクトリを /rails に設定します。
WORKDIR /rails

# ベースとなるパッケージをインストールします。
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libvips postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# 本番運用用の環境変数を設定します。
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# 最終イメージを軽くするための一時的なビルド段階です。
FROM base AS build

# gem をコンパイルしたりインストールしたりするために必要なツールを用意します。
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libyaml-dev pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# アプリケーションで使う gem をインストールします。
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# アプリケーションのコードをコピーします。
COPY . .

# 起動を速くするために bootsnap を事前コンパイルします。
RUN bundle exec bootsnap precompile app/ lib/

# 本番用のアセットを事前にコンパイルします。
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile




# ここから最終的に実行するアプリイメージを作ります。
FROM base

# ビルドステージで作成した gem とアプリ本体をコピーします。
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# 実行時には root ではないユーザーで動かすように設定します。
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER 1000:1000

# コンテナ起動時に最初に実行するスクリプトを指定します。
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# デフォルトでは Rails サーバーを起動します。必要なら起動時に上書きできます。
EXPOSE 3000
CMD ["./bin/rails", "server"]
