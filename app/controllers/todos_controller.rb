class TodosController < ApplicationController
  def new
    @todo  = Todo.new
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id

    if @todo.save
      redirect_to new_calender_todo_path
    else
      redirect_to calender_path(current_user)
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
