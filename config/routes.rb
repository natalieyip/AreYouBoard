Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'games#index'
  resources :games do
    resources :reviews
  end
  resources :users
  resources :tags
  resources :friends
  resources :friendsrequests
end
