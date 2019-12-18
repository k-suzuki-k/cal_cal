class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id).order(day: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @todos = Todo.where(user_id: current_user.id).where(day: @post.day)
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
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      redirect_to post_path(post)
    else
      render :show
    end
  end

  def destroy
    post = Post.find(params[:id])

    if post.destroy
      redirect_to posts_path(current_user)
    else
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :day, :title, :content)
  end
end
