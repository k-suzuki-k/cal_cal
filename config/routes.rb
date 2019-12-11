Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources  :users, only: [:show, :destroy, :update, :edit]
  get '/calender', to: 'users#calender'
end
