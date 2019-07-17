class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new

    if @post.save
      redirect_to posts_index_path
    else 
      render 'new'
    end

  end

  def index
    @posts = Post.all
  end

end
