class UsersController < ApplicationController

  # ログインユーザのみ自身の情報を編集、更新できる
  before_action :correct_user, only: [:edit, :update]
  def correct_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to calender_path(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to calender_path, flash: {notise: "プロフィールの変更が完了しました。"}
    else
      redirect_to edit_user_path, flash: {error: "プロフィールの変更に失敗しました。"}
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
