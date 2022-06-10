Rails.application.routes.draw do

  devise_for :users
  get "/journeys/:id/preview", to: "journeys#preview", as: :preview
  get '/profile', to: 'profiles#show'
  root to: 'pages#home'
  resources :journeys
  resources :venues do
    resources :journey_venues, only: %i[create]
  end
  resources :journey_venues, only: %i[destroy]
  resources :cities, only: %i[index show new create]

  # post "/cities/:id", to: "journeys#add_venue", as: :add_venue
  # delete "/cities/:id", to: "journeys#remove_venue", as: :remove_venue
end
