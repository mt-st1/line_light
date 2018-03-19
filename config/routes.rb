Rails.application.routes.draw do
  get 'friend_rooms/show'

  get 'rooms/show'

  devise_for :users
  root 'static_pages#index'
  get 'home', to: 'static_pages#home'
  get 'follow', to: 'static_pages#follow'
  post 'follow', to: 'static_pages#follow'
  get 'follow_user', to: 'static_pages#follow_user'
  post 'follow_user', to: 'static_pages#follow_user'
  get 'users', to: 'users#show_all'

  resources :users, only: [:show] do
    resources :friends, only: [:index]
  end
end
