Rails.application.routes.draw do
  devise_for :users

  root to: 'collections#index'

  resources :users, only: [:show]
  resources :collections
  resources :trades

end
