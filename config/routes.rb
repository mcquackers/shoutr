Rails.application.routes.draw do

  root "shouts#index"
  resources :text_subjects, only: [:create]
  resources :reshout_subjects, only: [:create]
  resources :image_subjects, only: [:create]
  resources :followers, only: [:index]
  resource :search, only: [:show]
  resources :shouts, only: [:index]
  resource :session, only: [:new, :create, :destroy]
  resource :notification, only: [:show]
  resources :users, only: [:new, :create, :index] do
    resource :following_relationship, only: [:create, :destroy]
  end
  get ':username', to: "users#show", as: :user
end
