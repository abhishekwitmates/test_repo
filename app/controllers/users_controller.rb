class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @multimedia = Post.all
  end

  def show
    @events = current_user&.events&.all
  end
end
