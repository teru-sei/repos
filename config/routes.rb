Rails.application.routes.draw do
  devise_for :users
  root to: 'cafes#index'
  resources :users, only: [:show, :edit, :update]
  resources :cafes do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
end
