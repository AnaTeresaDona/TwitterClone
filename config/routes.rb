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

  # get 'api/news'  Voy a reemplazar esta ruta por un scope, para que todas las rutas dentro del scope vivan en api.

  scope '/api' do
    get '/news', to: 'api#news', as: 'api_news'
    get '/:date1/:date2', to: 'api#tweets_between_dates', as: 'tweets_between_dates'
    post '/tweets', to: 'api#create_tweet'
  end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
