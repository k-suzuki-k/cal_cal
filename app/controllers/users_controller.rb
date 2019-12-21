class UsersController < ApplicationController

  # ログインユーザのみ自身の情報を編集、更新できる
  include CommonActions
  before_action :correct_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to calender_path
    else
      redirect_to edit_user_path
    end
  end

  # 退会画面の表示
  def destroy_confirm
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :profile)
  end
end
