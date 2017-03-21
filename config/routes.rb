Rails.application.routes.draw do
  devise_for :users
  root 'chat_groups#index'
  resources :groups, only: [:new, :edit, :create]
end
