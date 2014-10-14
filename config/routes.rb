Rails.application.routes.draw do

  root "shouts#index"
  resources :shouts, only: [:create, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index, :show] do
    resource :following_relationship, only: [:create, :destroy]
  end
end
