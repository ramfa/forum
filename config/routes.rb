Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :topics
  devise_for :admins
  devise_for :users
  root 'posts#index'
end
