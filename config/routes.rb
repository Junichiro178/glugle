Rails.application.routes.draw do
  resources :restaurant_cafes
  root 'restaurant_cafes#index'
end
