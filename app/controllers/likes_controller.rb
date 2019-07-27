class LikesController < ApplicationController

  def create
    @like = current_user.likes.build(post: Post.find(params[:post_id]))

    if @like.save
      redirect_to user_posts_path(current_user)
    else
      
    end
  end
end
