Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: 'profiles#show'
  root to: 'pages#home'
  resources :journeys do
    resources :journey_venues, only: %i[create]
  end
  resources :journey_venues, only: %i[delete]
  resources :venues
  resources :cities
  # resources :users, only: %i[show edit update]
end
