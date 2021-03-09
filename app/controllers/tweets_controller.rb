class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]
  before_action :set_current_tweet, only:[:likes, :retweet]


  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.order(created_at: DESC).page params[:page]
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id #esto es para que guarde el tweet con el susuario

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def likes
    #corazones solo pueden ser clickeados por el usuario autenticado. 
    #ver si el usuario que está logueado ya le había dado like.
    if @tweet.is_liked?(current_user)
      #Sí => tine que quitarle el like
      @tweet.remove_like(current_user)    
    else
      #No => tiene que darle like
      @tweet.add_like(current_user)
    end
    redirect_to root_path
  end

  def retweet
    new_tweet = Tweet.create(content: @tweet.content, user: current_user, rt_ref: @tweet.id)
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def set_current_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
