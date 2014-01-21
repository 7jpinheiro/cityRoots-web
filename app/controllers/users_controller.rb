class UsersController < ApplicationController
  def index
    if(current_user.role?(:admin))
      @users= User.all
    else
      redirect_to welcome_path
    end
  end

end
