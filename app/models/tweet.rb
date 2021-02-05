class Tweet < ApplicationRecord
  validates :content, presence: true
  
  
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user # mismo sistema que el del modelo user, pero estamos parados desde tweet y queremos saber cuántos likes. 

  paginates_per 2

end
