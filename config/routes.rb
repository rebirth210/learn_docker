Rails.application.routes.draw do
  # ルーティングは DSL で定義します。詳細は https://guides.rubyonrails.org/routing.html を参照してください。
  root "application#hello"

  # /up でアプリが正常に起動しているかを確認できます。例外がない場合は 200、そうでなければ 500 を返します。
  # ロードバランサーや uptime 監視ツールで動作確認に使えます。
  get "up" => "rails/health#show", as: :rails_health_check

  # app/views/pwa/* から動的な PWA ファイルを表示します。
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # ルートパス ("/") を定義します。
  # root "posts#index"
end
