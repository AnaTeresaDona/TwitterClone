class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet 
  has_many :friends, dependent: :destroy

#Creamos un listado de amiguis
  def users_followed
    arr_ids = self.friends.pluck(:friend_id) #Trae solo números id(porqe el campo es un integer)
    User.find(arr_ids) #Aquí se crean como objetos
  end

#Creamos un método que respone solo verdadero o falso: el listado de amiguis incluye al user?
  def is_following?(user)
    users_followed.include? (user)
  end

  def to_s
    username
  end

  # def arr_friends_id #aquí tengo el id de todos mis amigos, con esto nutro el scope de tweets_for_me (que es un método, ojo, los scope son métodos)
  #   self.friends.pluck(:friend_id)
  # end


end
