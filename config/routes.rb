Rails.application.routes.draw do
  devise_for :users
  resources :restaurant_cafes
  root 'restaurant_cafes#index'
end
