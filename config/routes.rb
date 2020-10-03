Rails.application.routes.draw do
  devise_for :users
  root 'restaurant_cafes#index'
  resources :users, only: [:edit, :update, :show]
  resources :restaurant_cafes
end
