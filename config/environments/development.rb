require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ここで設定した内容は config/application.rb の設定より優先されます。

  # 開発環境では、アプリケーションのコードが変更されるたびに再読み込みされます。
  # これにより応答時間は遅くなりますが、コード変更後に Web サーバーを再起動しなくてもよくなります。
  config.enable_reloading = true

  # 起動時にコードを先読み込みしません。
  config.eager_load = false

  # エラーの詳細を表示します。
  config.consider_all_requests_local = true

  # サーバータイミングを有効化します。
  config.server_timing = true

  # キャッシュを有効・無効にできます。既定では無効です。
  # rails dev:cache を実行すると切り替えられます。
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # アップロードされたファイルをローカルファイルシステムに保存します（設定は config/storage.yml を参照）。
  config.active_storage.service = :local

  # メーラー送信に失敗しても気にしません。
  config.action_mailer.raise_delivery_errors = false

  # Action Controller でキャッシュが有効でも、Action Mailer のテンプレートはキャッシュしません。
  config.action_mailer.perform_caching = false

  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Rails ロガーに非推奨メッセージを出力します。
  config.active_support.deprecation = :log

  # 許可されていない非推奨メッセージに対して例外を発生させます。
  config.active_support.disallowed_deprecation = :raise

  # 非推奨メッセージのうち、無視するものを指定します。
  config.active_support.disallowed_deprecation_warnings = []

  # マイグレーションが未適用のままページを読み込んだ場合にエラーを発生させます。
  config.active_record.migration_error = :page_load

  # データベースクエリを実行したコードをログにハイライト表示します。
  config.active_record.verbose_query_logs = true

  # バックグラウンドジョブの enqueue 処理をログにハイライト表示します。
  config.active_job.verbose_enqueue_logs = true

  # アセットリクエストのログ出力を抑制します。
  config.assets.quiet = true

  # 翻訳が見つからない場合にエラーを発生させます。
  # config.i18n.raise_on_missing_translations = true

  # レンダリングしたビューにファイル名を注釈します。
  config.action_view.annotate_rendered_view_with_filenames = true

  # Action Cable へのアクセスを任意の Origin から許可したい場合はコメントを外してください。
  # config.action_cable.disable_request_forgery_protection = true

  # before_action の only/except オプションで存在しないアクションを参照した場合にエラーを発生させます。
  config.action_controller.raise_on_missing_callback_actions = true

  # `bin/rails generate` で生成されたファイルに RuboCop の自動修正を適用します。
  # config.generators.apply_rubocop_autocorrect_after_generate!
end
