Rails.application.routes.draw do
  get "/journeys/:id/preview", to: "journeys#preview"
  # get "maps", to: "Maps#show"

  devise_for :users
  root to: 'pages#home'
  resources :journeys, only: %i[edit update index]
  resources :venues, only: %i[show new create edit update destroy]
  resources :cities, only: %i[show]
  # resources :users, only: %i[show edit update]
end
