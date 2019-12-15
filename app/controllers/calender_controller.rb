class CalenderController < ApplicationController
  def show
    @todo  = Todo.new
    @todo.category  = "work" #radio_buttonの初期値
  end
end
