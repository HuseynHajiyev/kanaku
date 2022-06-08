Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: 'profiles#show'
  root to: 'pages#home'
  resources :journeys do
    resources :joutney_venues, only: %i[create]
  end
  resources :joutney_venues, only: %i[delete]
  resources :venues
  resources :cities, only: %i[index show]
  # resources :users, only: %i[show edit update]
end
