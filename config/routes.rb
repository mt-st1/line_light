Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'rooms/show'

  devise_for :users
  root 'static_pages#index'
  get 'home', to: 'static_pages#home'
  get 'follow', to: 'static_pages#follow'
  get 'follow_user', to: 'static_pages#follow_user'
  post 'follow_user', to: 'static_pages#follow_user'
  post 'block_user', to: 'static_pages#block_user'
  post 'deep_block_user', to: 'static_pages#deep_block_user'
  get 'requesting', to: 'static_pages#requesting'
  get 'requested', to: 'static_pages#requested'
  get 'users', to: 'users#show_all'

  resources :users, only: [:show] do
    resources :friends, only: [:index]
  end

  resources :friend_rooms, only: [:show]
end
