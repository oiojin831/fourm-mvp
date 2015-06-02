Rails.application.routes.draw do
  root to: 'visitors#index'
  resources :searches, only: [:index]
end
