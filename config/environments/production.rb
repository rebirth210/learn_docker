require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ここで設定した内容は config/application.rb の設定より優先されます。

  # リクエスト間でコードを再読み込みしません。
  config.enable_reloading = false

  # 起動時にコードを先読み込みします。これにより Rails 本体とアプリケーションをメモリに読み込み、
  # スレッド対応サーバーやコピーオンライト方式のサーバーの性能を高めます。
  # Rake タスクは通常、この設定を無視してパフォーマンスを優先します。
  config.eager_load = true

  # エラーの詳細は表示せず、キャッシュを有効にします。
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # マスターキーが ENV["RAILS_MASTER_KEY"]、config/master.key、または
  # config/credentials/production.key から参照できるようにします。これは認証情報や他の暗号化ファイルを復号するために使われます。
  # config.require_master_key = true

  # `public/` から静的ファイルを配信せず、NGINX/Apache に任せます。
  # config.public_file_server.enabled = false

  # CSS をプリプロセッサで圧縮します。
  # config.assets.css_compressor = :sass

  # コンパイル済みアセットが見つからない場合にアセットパイプラインへフォールバックしません。
  config.assets.compile = false

  # 画像、スタイルシート、JavaScript をアセットサーバーから配信できるようにします。
  # config.asset_host = "http://assets.example.com"

  # サーバーがファイル送信時に使うヘッダーを指定します。
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # アップロードされたファイルをローカルファイルシステムに保存します（設定は config/storage.yml を参照）。
  config.active_storage.service = :local

  # Action Cable をメインプロセスやドメインの外に配置します。
  # config.action_cable.mount_path = nil
  # config.action_cable.url = "wss://example.com/cable"
  # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]

  # アプリケーションへのアクセスが SSL 終端済みのリバースプロキシ経由で行われていると仮定します。
  # これは Strict-Transport-Security と secure cookies と併用できます。
  # config.assume_ssl = true

  # すべてのアクセスを SSL 経由に強制し、Strict-Transport-Security と secure cookies を使います。
  config.force_ssl = true

  # デフォルトのヘルスチェックエンドポイントへの http→https リダイレクトをスキップします。
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  # 標準出力へログを出力します。
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # すべてのログ行に次のタグを付けます。
  config.log_tags = [ :request_id ]

  # "info" には一般的で有用なシステム運用情報が含まれますが、PII の漏えいを避けるために
  # 余分な情報は記録しません。すべてを記録したい場合はレベルを "debug" に設定してください。
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # production では別のキャッシュストアを使います。
  # config.cache_store = :mem_cache_store

  # Active Job 用の実キューイングバックエンドを使います（環境ごとに別キューに分ける）。
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "rails_app_production"

  # Action Controller でキャッシュが有効でも、Action Mailer のテンプレートはキャッシュしません。
  config.action_mailer.perform_caching = false

  # 不正なメールアドレスを無視し、メール配信エラーを発生させません。
  # すぐに配信エラーを起こしたい場合は true にして、メールサーバーを設定してください。
  # config.action_mailer.raise_delivery_errors = false

  # I18n で参照したときに、翻訳が見つからない場合は
  # I18n.default_locale にフォールバックするようにします。
  config.i18n.fallbacks = true

  # 非推奨メッセージはログに出しません。
  config.active_support.report_deprecations = false

  # マイグレーション後に schema をダンプしません。
  config.active_record.dump_schema_after_migration = false

  # production では inspection 時に :id のみを使います。
  config.active_record.attributes_for_inspect = [ :id ]

  # DNS rebinding 攻撃やその他の `Host` ヘッダー攻撃に対する保護を有効にします。
  # config.hosts = [
  #   "example.com",     # example.com からのアクセスを許可します
  #   /.*\.example\.com/ # www.example.com のようなサブドメインも許可します
  # ]
  # デフォルトのヘルスチェックエンドポイントに対する DNS rebinding 保護をスキップします。
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
