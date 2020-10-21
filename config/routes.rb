Rails.application.routes.draw do

  devise_for :users

  resources :posts

  resources :home, only: [:index]

  root 'home#index'

end
