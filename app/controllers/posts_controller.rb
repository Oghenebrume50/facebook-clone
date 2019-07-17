class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def show
    # @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else 
      render 'new'
    end

  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
