Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  get '/users/search' => 'users#search'
  resources :groups, only: [:index, :new, :edit, :update, :create] do
    resources :comments, only: [:index, :create]
  end
end
