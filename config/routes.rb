Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :car_versions
  resources :car_models
  resources :makes
  resources :photos
  resources :cars
  # You can have the root of your site routed with "root"
  root to: 'visitors#index'
end
