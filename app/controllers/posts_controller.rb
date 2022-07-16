class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
