class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :private_user

  def index
  end

  private
  def private_user
    if not current_user == @user = User.find_by(id: params[:user_id])
      redirect_to user_friends_url(:user_id => current_user.id)
    end
  end
end
