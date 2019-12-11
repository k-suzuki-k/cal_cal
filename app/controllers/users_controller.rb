class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def calender
  end
end
