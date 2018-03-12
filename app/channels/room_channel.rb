# サーバサイドの処理を受け持つチャンネル
class RoomChannel < ApplicationCable::Channel
  def subscribed
    # チャンネル名を指定して接続
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # messageをデータベースに保存
    Message.create! content: data['message'], user: current_user
  end
end
