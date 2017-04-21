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


  post '/games/:game_id/upvote', to: 'games#upvote'
  post '/games/:game_id/downvote', to: 'games#downvote'

  post '/games/:game_id/reviews/:review_id/upvote', to: 'reviews#upvote'
  # post '/games/:game_id/reviews/:review_id/downvote', to: 'reviews#downvote'


end
