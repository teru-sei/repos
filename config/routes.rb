Rails.application.routes.draw do
  devise_for :users
  root to: 'cafes#index'
  resources :cafes
end
