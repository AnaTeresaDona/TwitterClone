class HomeController < ApplicationController
  def index

    if signed_in?
      if (params[:search] && !params[:search].empty?)
        #buscamos en el resultado
        @tweets = Tweet.tweets_for_me(current_user).where("content LIKE ?", "%#{params[:search]}%").order(created_at: :desc).page params[:page] 
      else        
        #mostramos solo tweets amigos
        @tweets = Tweet.tweets_for_me(current_user).order(created_at: :desc).page params[:page]
      end
      @tweet = Tweet.new
    else 
        #los mostramos todos. Hay que ir a buscar los tweets y crear el scope
        @tweets = Tweet.order(created_at: :desc).page params[:page]
    end    
    
  end

  def all_tweets
    @tweets = Tweet.order(created_at: :desc).page params[:page]
    @tweet = Tweet.new
    render template: "home/index"
  end
end
