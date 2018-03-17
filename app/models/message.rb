class Message < ApplicationRecord
  belongs_to :user
  # ActiveRecordのcreateまたはcreate!メソッドが呼び出されて、
  # データベースへのコミットが正常終了したあとで{}内のブロックが後処理として呼び出される
  after_create_commit { MessageBroadcastJob.perform_later self }
end
