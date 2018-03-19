class FriendRoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    @friend = Friend.find_by(id: params[:id])
    self_id = @friend.from_user_id
    friend_id = @friend.to_user_id
    another_room_id = Friend.find_by(from_user_id: friend_id,
                                     to_user_id: self_id).id
    @self_messages = PersonalMessage.where(friend_id: params[:id])
    @friend_messages = PersonalMessage.where(friend_id: another_room_id)
    @personal_messages = (@self_messages + @friend_messages).sort_by { |message| message.created_at }
  end
end
