Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :searches, only: [:index, :create]
  resources :stores, only: [:show]
  get '/auth/:provider/callback', to: 'sessions#create'
end
