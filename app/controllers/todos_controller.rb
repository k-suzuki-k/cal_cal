class TodosController < ApplicationController
  def new
    @todo  = Todo.new
    @todo.category  = "work" #radio_buttonの初期値
    @todos = Todo.where(user_id: current_user.id)
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id

    if @todo.save
      respond_to do |format|
        format.html { redirect_to :new_calender_todo, notice: 'todos was successfully created!!!'}
        format.json { render 'new', status: :created, location: @todo }
        format.js
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end

  end

  def search
    @todos = Todo.where(user_id: current_user.id).where('day LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'calender#show', json: @todos }
    end
  end

  def edit
  end

  def show
  end

  def index
  end

  private
  def todo_params
    params.require(:todo).permit(:user_id, :day, :title, :start_time, :end_time, :category, :content, :image)
  end

end
