class Tweet < ApplicationRecord
  include ActionView::Helpers::UrlHelper
  
  before_save :add_hashtags
  validates :content, presence: true
  
  
  
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user # mismo sistema que el del modelo user, pero estamos parados desde tweet y queremos saber cuántos likes. 

  paginates_per 50

  scope :tweets_for_me, -> (user) { where(user_id: user.friends.pluck(:friend_id).push(user.id)) }#Estoy haciendo una query a la instancia tweet (donde estoy parada) y le paso un arreglo de id al user_id

  def add_hashtags 
    new_array = []
    self.content.split(" ").each do |word|
      if word.start_with?("#") 
        word_parsed = word.sub '#', '%23'
        word = link_to(word, Rails.application.routes.url_helpers.root_path+"?search="+word_parsed)
      end
      new_array.push(word)
    end
    self.content = new_array.join(" ")
  end

  def is_liked?(user)
    self.liking_users.include?(user) ? true : false
  end

  def remove_like(user)
    Like.where(user: user, tweet: self).first.destroy
  end

  def add_like(user)
    Like.create(user: user, tweet: self)
  end

  def count_rt
    Tweet.where(rt_ref: self.id).count
  end

  def is_retweet?
    rt_ref ? true : false
  end

  def tweet_ref
    Tweet.find(self.rt_ref)
  end
  
end
