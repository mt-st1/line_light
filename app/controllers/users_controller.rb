class UsersController < ApplicationController
before_action :authenticate_user!
before_action :admin_user, only: [:show_all]

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
end
