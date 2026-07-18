require "active_support/core_ext/integer/time"

# テスト環境はアプリケーションのテストスイートを実行するためだけに使われます。
# それ以外では通常触る必要はありません。テスト用データベースは
# テスト実行のたびに消去・再作成される一時的な領域なので、ここに置いたデータを頼りにしないでください。

Rails.application.configure do
  # ここで設定した内容は config/application.rb の設定より優先されます。

  # テスト中はファイル監視を行わず、再読み込みは必要ありません。
  config.enable_reloading = false

  # アプリケーション全体を先読み込みすることは、ローカルで単体テストを実行する場合には通常不要で、
  # テストスイートの速度を低下させることがあります。ただし、CI 環境では eager loading が正常に動作しているかを
  # 確認するため、有効にすることが推奨されます。
  config.eager_load = ENV["CI"].present?

  # テスト用に Cache-Control を設定して、パブリックファイルサーバーの性能を向上させます。
  config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.hour.to_i}" }

  # エラーの詳細を表示し、キャッシュは無効にします。
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # 回復可能な例外に対して例外テンプレートを表示し、他の例外はそのまま発生させます。
  config.action_dispatch.show_exceptions = :rescuable

  # テスト環境では CSRF 保護を無効にします。
  config.action_controller.allow_forgery_protection = false

  # アップロードされたファイルを一時ディレクトリに保存します。
  config.active_storage.service = :test

  # Action Controller でキャッシュが有効でも、Action Mailer のテンプレートはキャッシュしません。
  config.action_mailer.perform_caching = false

  # Action Mailer に実際のメール送信をさせません。
  # :test 配信方法では送信されたメールを ActionMailer::Base.deliveries 配列に蓄積します。
  config.action_mailer.delivery_method = :test

  # コントローラとは異なり、メーラーインスタンスにはリクエストの文脈がないため、
  # その場で :host パラメータを指定する必要があります。
  config.action_mailer.default_url_options = { host: "www.example.com" }

  # 非推奨メッセージを stderr に出力します。
  config.active_support.deprecation = :stderr

  # 許可されていない非推奨メッセージに対して例外を発生させます。
  config.active_support.disallowed_deprecation = :raise

  # 非推奨メッセージのうち、無視するものを指定します。
  config.active_support.disallowed_deprecation_warnings = []

  # 翻訳が見つからない場合にエラーを発生させます。
  # config.i18n.raise_on_missing_translations = true

  # レンダリングしたビューにファイル名を注釈します。
  # config.action_view.annotate_rendered_view_with_filenames = true

  # before_action の only/except オプションで存在しないアクションを参照した場合にエラーを発生させます。
  config.action_controller.raise_on_missing_callback_actions = true
end
