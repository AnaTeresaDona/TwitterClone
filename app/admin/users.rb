ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :photo_url, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :photo_url, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #cada usuario aparecerá junto al número de cuentas que sigue,
  #cantidad detweets realizados, 
  #cantidad de likes dados y,
  #la cantidad de retweets.

  index do

    column :email
    column :username
    column :photo_url
    column :friends_count
    column :tweets_count
    column :likes_given
    column :retweets_given

    actions
    
  end
  
end
