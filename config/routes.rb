Rails.application.routes.draw do
  # ログイン&登録画面
  root to: 'welcome#index'
  get '/welcome', to: 'welcome#index'

  # デバイスの設定
  devise_for :users

  authenticated :user do # ログインしないとアクセスできない設定

    resources  :users, only: [:update, :edit]

    resources  :calender, only: [:show] do
      resources :todos
    end

    resources  :posts

    # todo_list を作成するため
    get '/todos/search', to: 'todos#search'

    # 退会手続き画面
    get '/destroy_confirm', to: 'users#destroy_confirm', as: :user_destroy_confirm

    # パスワード変更
    resources  :passwords, only: [:update, :edit]
  end

end
