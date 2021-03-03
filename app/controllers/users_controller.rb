class UsersController < ApplicationController

  #Método follow: si existe se destruye, si no, se crea
  def follow

    if current_user.is_following?(User.find(params[:user_id]))
      Friend.where(user: current_user, friend_id: params[:user_id]).first.destroy
    else 
      Friend.create(user: current_user, friend_id: params[:user_id])
    end
    redirect_to root_path 
    
  end

end
