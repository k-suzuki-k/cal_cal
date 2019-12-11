class ApplicationController < ActionController::Base
  # 登録&ログイン後の画面
  def after_sign_in_path_for(resource)
    calender_path
  end
end
