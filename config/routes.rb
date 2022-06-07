Rails.application.routes.draw do
  get 'venues/show'
  get 'venues/new'
  get 'venues/create'
  get 'venues/edit'
  get 'venues/update'
  get 'venues/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: %i[edit update index]
  resources :venues, only: %i[show new create edit update destroy]
  resources :cities, only: %i[show]
  # resources :users, only: %i[show edit update]
end
