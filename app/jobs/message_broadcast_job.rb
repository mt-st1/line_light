class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # Messageモデルのデータがcreateされコミットが正常終了したあと、呼び出されブロードキャストする
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

  def render_message(message)
    # コントローラー以外の場所でレンダリング
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
