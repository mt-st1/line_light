class FriendRoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    self_id = Friend.find_by(id: params[:id]).from_user_id
    friend_id = Friend.find_by(id: params[:id]).to_user_id
    another_room_id = Friend.find_by(from_user_id: friend_id,
                                     to_user_id: self_id).id
    @self_messages = PersonalMessage.find_by(id: params[:id])
    @friend_messages = PersonalMessage.find_by(id: another_room_id)
  end
end
