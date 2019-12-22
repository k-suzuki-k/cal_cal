class PasswordsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if current_user.update_with_password(password_params)
      # パスワードを変更するとログアウトしてしまうので、再ログインが必要
      sign_in(current_user, bypass: true)
      redirect_to calender_path, flash: {notise: "パスワードの変更が完了しました。"}
    else
      redirect_to edit_password_path, flash: {error: "パスワードの変更に失敗しました。"}
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
