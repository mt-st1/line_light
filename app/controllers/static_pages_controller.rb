class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  skip_before_filter :verify_authenticity_token
  def index
  end

  def home
  end

  def follow
    # @target = User.find_by(email: params[:email])
    # current_user.follow(@target)
    # if @target.friends_of_target.include?(self)
    #   flash[:notice] = "became friend with #{@target.email}"
    # else
    #   flash[:alert] = "can't become friend..."
    # end
  end
end
