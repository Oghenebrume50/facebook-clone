class FriendingsController < ApplicationController
  
  def friend_requests
    @friend_requests = current_user.friendings.where('status = false')
  end

  def send_friend_request
    @send_friend_request  =  
    current_user.friendings.build(status: false, invited_user_id: params[:id])

    if @send_friend_request.save

    else
    
    end

  end

  def accept_friend_request
    @friend = current_user.friendings.find_by(inviting_user_id: params[:id])

    if @friend.update(status: true)

    else
    
    end
  end
end
