class FriendRoomChannel < ApplicationCable::Channel
  def subscribed
    friend = Friend.find_by(id: params[:room_id])
    relative_friend = Friend.find_by(from_user_id: friend.to_user_id, to_user_id: friend.from_user_id)
    if current_user.id == friend.from_user_id
      stream_from "friend_room_channel_#{params[:room_id]}"
    elsif current_user.id == friend.to_user_id
      stream_from "friend_room_channel_#{relative_friend.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    PersonalMessage.create!(content: data['personal_message'], friend: Friend.find_by(id: params[:room_id]))
  end
end
