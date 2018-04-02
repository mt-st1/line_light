class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :follow, :follow_user, :block_user, :deep_block_user]
  skip_before_filter :verify_authenticity_token

  def index
  end

  def home
  end

  def follow
  end

  def follow_user
    @user = current_user
    begin
      if target = User.find_by(email: params[:email])
        if @user.follow target
          if @user.friend_with?(target)
            redirect_to "/users/#{target.id}", notice: "#{target.username}と友達になりました"
          else
            flash.now[:notice] = "#{target.username}に友達申請しました"
            render :follow
          end
        else
          redirect_to follow_url, alert: '自身はフォローできません'
        end
      else
        flash.now[:alert] = '不正なメールアドレスです'
        render :follow
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:alert] = '既にフォローしているユーザです'
      render :follow
    end
  end

  def block_user
    if target = User.find_by(email: params[:email])
      target.block current_user
      redirect_to user_requested_url(:user_id => current_user.id), notice: "#{target.username}からのリクエストを拒否しました"
    end
  end

  def deep_block_user
    if target = User.find_by(email: params[:email])
      current_user.deep_block target
      redirect_to user_friends_url(:user_id => current_user.id), notice: "#{target.username}をブロックしました"
    end
  end
end
