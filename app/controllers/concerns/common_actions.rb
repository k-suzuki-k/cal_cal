module CommonActions
  extend ActiveSupport::Concern

  # ログインユーザのみ自身の情報を編集、更新できる
  def correct_user
    @user = User.find(params[:id])
    @user_chk = current_user
    unless @user == @user_chk
      redirect_to calender_path(@user_chk)
    end
  end
end
