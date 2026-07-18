require_relative "boot"

require "rails/all"

# Gemfile に記載された gem を読み込みます。:test、:development、:production のどれに属するかも含めて読み込みます。
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # 生成時のデフォルト設定を初期化します。
    config.load_defaults 7.2

    # `ignore` リストに追加して、`.rb` ファイルを含まない `lib` 配下のディレクトリや、
    # 再読み込み・即時読み込みしないものを指定できます。
    # 代表例として `templates`、`generators`、`middleware` などがあります。
    config.autoload_lib(ignore: %w[assets tasks])

    # アプリケーション、エンジン、Railtie の設定をここに書きます。
    #
    # これらの設定は、後で読み込まれる config/environments 配下のファイルで
    # 環境ごとに上書きできます。
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
