class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  	def sign_up_params
  		params.require(:email).permit(:city_id, :password, :password_confirmation)
	end
end
