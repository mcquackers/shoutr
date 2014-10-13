Rails.application.routes.draw do

  root "shouts#index"
  resources :shouts, only: [:create, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
