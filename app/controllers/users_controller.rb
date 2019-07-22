class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user_posts = current_user.posts.all
  end
end
