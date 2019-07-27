class PostsController < ApplicationController

  def index
    @posts = current_user.timeline_posts(current_user).flatten
    @post = Post.new
    @comment = Comment.new
    @user = current_user
  end

  # def show
  # end

  # def new
  # end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(current_user)
    else 
      render 'new'
    end

  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
