Rails.application.routes.draw do
  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
    end
