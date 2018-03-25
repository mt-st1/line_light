class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:show_all]
  before_action :friend_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def show_all
    @users = User.all
  end

  private
  def admin_user
    if not current_user.admin_flg?
      redirect_to user_path(:id => current_user.id), :alert => '管理者権限がありません'
    end
  end

  def friend_user
    if not current_user.admin_flg?
      if target = User.find_by(id: params[:id])
        if current_user == target
          redirect_to home_url
        elsif not current_user.friend_with?(target)
          begin
            redirect_to :back, :alert => '友達ではないユーザの情報は見れません'
          rescue ActionController::RedirectBackError
            redirect_to_user_friends
          end
        end
      end
    end
  end

  def redirect_to_user_friends
    redirect_to user_friends_url(:user_id => current_user.id), :alert => '友達ではないユーザの情報は見れません'
  end
end
