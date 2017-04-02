Rails.application.routes.draw do
  devise_for :users
  root "comments#index"
  resources :groups, only: [:new, :edit, :update, :destroy, :create]
  resources :comments, only: [:index, :create]
end
