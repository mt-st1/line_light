class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :follow, :follow_user]
  skip_before_filter :verify_authenticity_token

  def home
  end

  def follow
  end

  def follow_user
    @user = current_user
    begin
      if target = User.find_by(email: params[:email])
        if @user.follow target
          redirect_to "/users/#{target.id}", notice: "#{target.email}をフォローしました"
        else
          redirect_to action: 'follow', alert: "#{target.email}をフォローできませんでした"
        end
      else
        flash.now[:invalid] = '不正なメールアドレスです'
        render :follow
      end
    rescue ActiveRecord::RecordNotUnique
      flash.now[:nonunique] = '既にフォローしているユーザです'
      render :follow
    end
  end
end
