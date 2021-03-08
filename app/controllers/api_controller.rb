class ApiController < ApplicationController
skip_before_action :verify_authenticity_token

  def news
    #render json: Tweet.last(50)
    tweets = Tweet.last(50)

    hash_result =tweets.map do |t|
      t.my_hash
    end
    render json: hash_result
  end

  def valid_tweet_date?(strdate)
    date_to_s = strdate.split("-").map(&:to_i)
    if strdate.match(/\d{4}-\d{2}-\d{2}/) && Date.valid_date?(date_to_s[0], date_to_s[1], date_to_s[2])
      true
    else    
      false
    end
    
  end

  def tweets_between_dates
    date1 = params[:date1]
    date2 = params[:date2]

    if (valid_tweet_date?(date1) && valid_tweet_date?(date2))      
      date1 = Date.parse(params[:date1])
      date2 = Date.parse(params[:date2])
      if date1 > date2
        render json: {errors: "Error: con el rango de las fechas usado"}
      else
        tweets = Tweet.where(created_at: date1..date2)
        hash_result =tweets.map do |t|
          t.my_hash
        end
        
        render json: hash_result
      end
      
    else 
      render json: {errors: "Error: Fecha inválida"}
    end
  end
 
  #Creo una validación de seguridad (porque se la saqué antes)
  def create_tweet
    user = User.authenticate(params[:email], params[:password])
    if !user.nil?
      @tweet = Tweet.new(tweet_params)
        @tweet.user = user
        if @tweet.save 
          render json: @tweet 
        else 
          render json: {errors: "Error, el tweet no pudo crearse"}
        end
      else  
        render json: {errors: "Error with credentials"}
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end

end
