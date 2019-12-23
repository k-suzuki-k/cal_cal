class PostsController < ApplicationController

  # 投稿者のみ自身の情報を編集、更新できる
  before_action :post_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.where(user_id: params[:format]).order(day: "DESC").includes(:user)
    @user = User.find(params[:format])
  end

  def show
    @post = Post.find(params[:id])
    @todos = Todo.where(user_id: @post.user_id).where(day: @post.day).order_todo_list
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if post.save
      redirect_to post_path(post.id)
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

  def search_list
    # search_list.htmlを表示させる
  end

  # search_js.erbをレスポンスする
  def search
    @posts = Post.post_search(params).includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :day, :title, :content)
  end

  def post_correct_user
    post_user = Post.find(params[:id]).user
    unless post_user == current_user
      redirect_to calender_path(current_user)
    end
  end
end
