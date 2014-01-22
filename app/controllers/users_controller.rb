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
  
  # GET /users/1
  # GET /users/1.json
  def show
      @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
        @user = User.find(params[:id])

  end

  
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Utilizador actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_users/1
  # DELETE /web_users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_index_path }
      format.json { head :no_content }
    end
  end

  def activar
    @user = User.find(params[:id])
    @web_user = @user.web_user
    @web_user.active = 1
    @web_user.save
      if @web_user.save
          flash[:notice] = "Utilizador activado!"
      else
        flash[:error] = "Ocorreu um erro."     
      end
    
    redirect_to(users_index_path)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :country_id, :city_id)
    end
end
