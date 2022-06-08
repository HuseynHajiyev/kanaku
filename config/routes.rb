Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: 'profiles#show'
  root to: 'pages#home'
  resources :journeys do
    resources :journey_venues, only: %i[create]
  end
  resources :journey_venues, only: %i[create delete]
  resources :venues
  resources :cities, only: %i[index show new create]
  # resources :users, only: %i[show edit update]
end
