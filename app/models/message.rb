class Message < ApplicationRecord
  belongs_to :user
  # データが生成されトランザクションをコミットしたあとでブロードキャスト
  after_create_commit { MessageBroadcastJob.perform_later self }
end
