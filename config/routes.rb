Rails.application.routes.draw do
  devise_for :users

  root to: 'collections#index'
  get 'collections/trades' => 'trades#index'

  resources :users, only: [:show]
  resources :collections do
    resources :trades, only: [:index, :new, :create, :edit, :destroy]
  end
end
