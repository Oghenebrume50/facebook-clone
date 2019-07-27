class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to user_posts_path(current_user)
    else
      
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
