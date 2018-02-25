class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  def index
  end

  def home
  end
end
