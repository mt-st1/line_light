class PersonalMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(personal_message)
    self_room_id = personal_message.friend_id
    friend = Friend.find_by(id: self_room_id)
    another_room_id = Friend.find_by(from_user_id: friend.to_user_id, to_user_id: friend.from_user_id).id
    logger.debug("self_room_id: #{self_room_id}")
    logger.debug("another_room_id: #{another_room_id}")
    ActionCable.server.broadcast "friend_room_channel_#{self_room_id}", personal_message: render_self_message(personal_message)
    ActionCable.server.broadcast "friend_room_channel_#{another_room_id}", personal_message: render_friend_message(personal_message)
  end

  private

  def render_self_message(personal_message)
    ApplicationController.renderer.render(partial: 'personal_messages/self_message', locals: { self_message: personal_message })
  end

  def render_friend_message(personal_message)
    ApplicationController.renderer.render(partial: 'personal_messages/friend_message', locals: { friend_message: personal_message })
  end
end
