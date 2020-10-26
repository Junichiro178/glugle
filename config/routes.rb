Rails.application.routes.draw do
  devise_for :users
  root 'cafe_restaurants#index'
  resources :users, only: [:edit, :update, :show]

  resources :cafe_restaurants do
    collection do
      get 'search'
    end
  end

end
