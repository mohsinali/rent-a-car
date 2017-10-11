Rails.application.routes.draw do

  resources :references
  resources :bookings
  resources :customers
  devise_for :users
  resources :users
  # You can have the root of your site routed with "root"
  root to: 'visitors#index'
end
