# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # ログイン失敗後にwelcomeページに戻す
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.valid_password?(params[:user][:password])
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      redirect_to calender_path(user)
    else
      clean_up_passwords user
      set_minimum_password_length
      redirect_to welcome_path, flash: {error: "ログイン処理: メールアドレスかパスワードが間違っています。"}
    end
  end

  def log_in(user)
        session[:user_id] = user.id
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
