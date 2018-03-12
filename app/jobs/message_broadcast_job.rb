class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private

  def render_message(message)
    # コントローラー以外の場所でレンダリング
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
