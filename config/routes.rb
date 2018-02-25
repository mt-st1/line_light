Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  get 'home', to: 'static_pages#home'
end
