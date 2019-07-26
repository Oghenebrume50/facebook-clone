class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      @user_posts = @user.posts.all if @user
    else
    end
  end
end
