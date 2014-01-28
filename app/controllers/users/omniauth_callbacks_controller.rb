class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


   def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    elsif @user == false
      flash[:notice] = "Já esta registado com um email igual ao que usa no facebook! Use esse email para fazer login!"
      redirect_to new_user_registration_url
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

end