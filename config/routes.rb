Rails.application.routes.draw do

  devise_for :users

  resources :user, only: [] do
    resources :posts
  end

  resources :home, only: [:index]

  root 'home#index'

end
