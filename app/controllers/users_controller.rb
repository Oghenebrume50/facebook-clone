class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @posts = curent_user.posts.all
  end
end
