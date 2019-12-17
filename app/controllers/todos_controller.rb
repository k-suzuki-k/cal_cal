class TodosController < ApplicationController
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
      @todos = Todo.where(user_id: current_user.id).where(day: search_day)

      respond_to do |format|
        format.html { redirect_to :new_calender_todo, notice: 'todos was successfully created!!!'}
        format.json { render 'calender#show', status: :created, location: @todos }
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

  def show
    @todo_show = Todo.where(user_id: params[:calender_id]).where(id: params[:keyword])
  end

  def update
    @todo = Todo.find(params[:calender_id])
    @search_day = todo_params[:day] #todoリストのタイトルを変えるためインスタンス変数

    if @todo.update(todo_params)

      #todo_listの抽出
      @todos = Todo.where(user_id: current_user.id).where(day: @search_day)

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
      @todos = Todo.where(user_id: current_user.id).where(day: search_day)

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
