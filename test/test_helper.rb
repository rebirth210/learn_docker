ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # 指定したワーカー数でテストを並列実行します。
    parallelize(workers: :number_of_processors)

    # test/fixtures/*.yml にあるフィクスチャを、アルファベット順にすべて読み込みます。
    fixtures :all

    # ここにすべてのテストで使う共通ヘルパーメソッドを追加できます。
  end
end
