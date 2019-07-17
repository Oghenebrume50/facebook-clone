class CommentsController < ApplicationController

  def create
    @comment = Post.find(:id).comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to posts_index_path
    else
      
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
