class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user_posts = current_user.posts.all
  end

  def notification
    @friend_requests = current_user.friend_requests
  end

  def send_request
    @friend_request = Friendship.create(confirmed: false, user_id: params[:user_id], friend_id: params[:friend_id])
    if @friend_request.save
      redirect_back(fallback_location: root_path) #This reloads the current page so as to see the update.
    else
      redirect_to root_path
    end

  end

  def accept_request
    @accept_friend = Friendship.find_by(user_id: params[:user_id], friend_id: current_user)
    @accept_friend.update(confirmed: true)

    if @accept_friend.save
      redirect_back(fallback_location: root_path) #This reloads the current page so as to see the update.
    else
      redirect_to root_path
    end
  end

end
