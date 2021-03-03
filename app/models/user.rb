class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes
  has_many :liked_tweets, through: :likes, source: :tweet #es un método que permite saber a qué tweet el usuario le hizo like.
  has_many :friends, dependent: :destroy


  def users_followed
    arr_ids = self.friends.pluck(:friend_id) #ahora en ese arreglo (arr_ids) tengo guardados todos mis amigos.
    User.find(arr_ids)
  end

  def is_following?(user)
    users_followed.include?(user)
  end

  def to_s
    username
  end



end
