Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: %i[edit update index]
  resources :venues, only: %i[show new create edit update destroy]
  resources :cities, only: %i[show]
  # resources :users, only: %i[show edit update]
end
