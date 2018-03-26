class FriendRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :private_user

  def show
    self_id = @friend.from_user_id
    friend_id = @friend.to_user_id
    another_room_id = Friend.find_by(from_user_id: friend_id,
                                     to_user_id: self_id).id
    @self_messages = PersonalMessage.where(friend_id: params[:id])
    @friend_messages = PersonalMessage.where(friend_id: another_room_id)
    @personal_messages = (@self_messages + @friend_messages).sort_by { |message| message.created_at }
  end

  private
  def private_user
    if @friend = Friend.find_by(id: params[:id])
      if not current_user == @friend.from_user
        redirect_to user_friends_url(:user_id => current_user.id)
      end
    else
      redirect_to user_friends_url(:user_id => current_user.id)
    end
  end
end
