class ApplicationController < ActionController::Base
  # WebP 画像、Web Push、バッジ、Import Map、CSS nesting、CSS :has をサポートする最新ブラウザのみを許可します。
  allow_browser versions: :modern

  def hello
    render html: "Hello, world!"
  end
end
