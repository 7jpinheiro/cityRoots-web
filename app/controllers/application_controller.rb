class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def after_sign_up_path_for(resource)
    puts "------------- after_sign_up_path_for -----------------"
    if current_user.role? (:new_user)
        puts "------------- new_user -----------------"
        new_web_user_path(resource)
    else
        puts "------------- não é new_user -----------------"
        after_sign_in_path_for(resource)
    end
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?


  protect_from_forgery with: :exception
  protected
  	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:city_id,:language_id, :email, :password, :password_confirmation, :username, :country_id) }
    end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  
end
