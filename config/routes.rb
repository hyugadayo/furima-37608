Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :comments, only: :create
    resources :purchases, only: [:index ,:create]
  end
  root to: 'items#index'
end
