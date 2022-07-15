class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end
end
