Rails.application.routes.draw do
  resources :users
  resources :pictures
  resources :sessions, only: [:new, :create, :destroy]
end
