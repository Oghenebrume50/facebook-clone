class LikesController < ApplicationController

  def create
    @like = Post.find(:id).likes.build
    @like.user_id = current_user.id

    if @like.save
      redirect_to posts_index_path
    else
      
    end
  end
end
