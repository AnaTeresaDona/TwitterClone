Rails.application.routes.draw do
  resources :tweets do  
    post 'likes', to: 'tweets/likes'
    post 'retweet', to: 'tweets/retweet'
  end
  devise_for :users
  get 'home/index'

  post 'follow/:user_id', to: 'users#follow', as: 'users_follow'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
