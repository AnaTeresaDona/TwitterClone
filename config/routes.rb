Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  resources :tweets do  
    post 'likes', to: 'tweets/likes'
    post 'retweet', to: 'tweets/retweet'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'home/index'
  get 'all_tweets', to: 'home#all_tweets', as: 'all_tweets'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  post 'follow/:user_id', to: 'users#follow', as: 'users_follow'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
