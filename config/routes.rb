Rails.application.routes.draw do
  get 'rooms/show'

  devise_for :users
  root 'static_pages#index'
  get 'home', to: 'static_pages#home'
  get 'follow', to: 'static_pages#follow'
  post 'follow', to: 'static_pages#follow'
  resources :friends, only: [:create, :destroy]

  resources :users, only: [:show]
end
