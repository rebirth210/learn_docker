# このファイルを変更したら、サーバーを再起動してください。

# パラメータを部分一致でマッチさせ、ログから除外できるように設定します（例: passw は password にマッチします）。
# これにより、機密情報の漏えいを抑えます。
# ActiveSupport::ParameterFilter のドキュメントでサポートされている記法と動作を参照してください。
Rails.application.config.filter_parameters += [
  :passw, :email, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
]
