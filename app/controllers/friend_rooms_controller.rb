class FriendRoomsController < ApplicationController
  before_action :authenticate_user!
  def show
    self_id = Friend.find_by(id: params[:id]).from_user_id
    friend_id = Friend.find_by(id: params[:id]).to_user_id
  end
end
