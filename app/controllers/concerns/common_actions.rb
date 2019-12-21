module CommonActions
  extend ActiveSupport::Concern

  # ログインユーザのみ自身の情報を編集、更新できる
  def correct_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to calender_path(current_user)
    end
  end
end
