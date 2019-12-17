class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id).order(day: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if post.save
      redirect_to post_path(post)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :day, :title, :content)
  end
end
