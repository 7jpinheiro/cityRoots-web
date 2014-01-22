class UsersController < ApplicationController
  def index
    if(current_user.role?(:admin))
      if params[:filter]==nil
        @users= User.all
      end
      if params[:filter]=="entidade"
        @users= User.all
      end
    else
      redirect_to welcome_path
    end
  end

end
