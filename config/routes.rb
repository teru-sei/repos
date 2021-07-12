Rails.application.routes.draw do
  devise_for :users
  root to: 'cafes#index'
  resources :users, only: [:show]
  resources :cafes do
    collection do
      get 'search'
    end
  end
end
