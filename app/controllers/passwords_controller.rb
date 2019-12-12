class PasswordsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update_with_password(password_params)
        # パスワードを変更するとログアウトしてしまうので、再ログインが必要
        sign_in(current_user, bypass: true)
        format.html { redirect_to calender_path }
      else
        format.html { redirect_to edit_password_path }
      end
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
