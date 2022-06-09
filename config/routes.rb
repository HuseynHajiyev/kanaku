Rails.application.routes.draw do

  devise_for :users
  get "/journeys/:id/preview", to: "journeys#preview", as: :preview
  get '/profile', to: 'profiles#show'
  root to: 'pages#home'
  resources :journeys do
    resources :journey_venues, only: %i[create]
  end
  resources :journey_venues, only: %i[create delete]
  resources :venues
  resources :cities, only: %i[index show new create]
end
