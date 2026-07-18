class ApplicationJob < ActiveJob::Base
  # デッドロックが発生したジョブを自動的に再試行します。
  # retry_on ActiveRecord::Deadlocked

  # 対応するレコードが見つからなくなっても、多くのジョブは無視して問題ありません。
  # discard_on ActiveJob::DeserializationError
end
