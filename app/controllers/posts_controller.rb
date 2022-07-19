class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    puts params
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end
end
