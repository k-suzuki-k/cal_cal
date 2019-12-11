Rails.application.routes.draw do
  # ログイン&登録画面
  root to: 'welcome#index'

  # デバイスの設定
  devise_for :users

  resources  :users, only: [:update, :edit]
  get '/calender', to: 'users#calender'

  # 退会手続き画面
  get '/destroy_confirm', to: 'users#destroy_confirm', as: :user_destroy_confirm
end
