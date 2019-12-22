class TodosController < ApplicationController

  # 投稿者のみ自身の情報を編集、更新できる
  before_action :todo_correct_user, only: [:edit, :update, :destroy]
  def todo_correct_user
    todo_user = Todo.find(params[:calender_id]).user
    unless todo_user == current_user
      redirect_to calender_path(current_user)
    end
  end

  def new
    @todo  = Todo.new
    @todo.category  = "work" #radio_buttonの初期値
    @todos = Todo.where(user_id: current_user.id)
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    search_day = todo_params[:day]

    if @todo.save
      #todo_listの抽出
      @todos = Todo.user_todo_list(current_user.id, search_day).order_todo_list
      respond_to do |format|
        format.js
      end
    end
  end

  # 入力フォームの日付を変えると非同期で検索結果を返す
  def search
    @todos = Todo.where(user_id: current_user.id).where('day LIKE(?)', "%#{params[:keyword]}%").order_todo_list
    respond_to do |format|
      format.json { render 'calender#show', json: @todos }
    end
  end

  def show
    @todo_show = Todo.where(user_id: params[:calender_id]).where(id: params[:keyword])
  end

  def update
    @todo = Todo.find(params[:calender_id])
    @search_day = todo_params[:day] #todoリストのタイトルを変えるためインスタンス変数

    if @todo.update(todo_params)
      #todo_listの抽出
      @todos = Todo.user_todo_list(current_user.id, @search_day).order_todo_list
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:calender_id])
    search_day = @todo.day

    if @todo.destroy
      #todo_listの抽出
      @todos = Todo.user_todo_list(current_user.id, search_day).order_todo_list
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:id, :user_id, :day, :title, :start_time, :end_time, :category, :content, :image)
  end
end
