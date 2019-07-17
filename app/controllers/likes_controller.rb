class LikesController < ApplicationController

  def create
    @like = Post.find(params[:id]).likes.build
    @like.user_id = current_user.id

    if @like.save
      redirect_to posts_path
    else
      
    end
  end
end
