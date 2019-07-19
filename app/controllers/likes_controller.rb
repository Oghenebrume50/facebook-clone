class LikesController < ApplicationController

  def create
    @like = Post.find(params[:post_id]).likes.build
    @like.user_id = current_user.id

    if @like.save
      redirect_to user_posts_path(current_user)
    else
      
    end
  end
end
