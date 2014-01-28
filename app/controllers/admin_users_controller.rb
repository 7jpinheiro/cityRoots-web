class AdminUsersController < ApplicationController
 

  def index
    if(current_user.role?(:admin))
      if params[:filter]==nil
        @admin_users= User.all
      end
      if params[:filter]=="entidade"
        @admin_users= User.all
      end
    else
      redirect_to welcome_path
    end
  end
  
  # GET /admin_admin_users/1
  # GET /admin_admin_users/1.json
  def show
      @admin_user = User.find(params[:id])
  end

  # GET /admin_admin_users/1/edit
  def edit
        @admin_user = User.find(params[:id])

  end

  
  # PATCH/PUT /admin_admin_users/1
  # PATCH/PUT /admin_admin_users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to @admin_user, notice: 'Utilizador actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_admin_admin_users/1
  # DELETE /web_admin_admin_users/1.json
  def destroy
    @admin_user = User.find(params[:id])
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_index_path }
      format.json { head :no_content }
    end
  end

  def activar
    @admin_user = User.find(params[:id])
    @web_user = @admin_user.web_user
    @web_user.active = 1
    @web_user.save
      if @web_user.save
          flash[:notice] = "Utilizador activado!"
      else
        flash[:error] = "Ocorreu um erro."     
      end
    
    redirect_to(admin_users_index_path)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:admin_user).permit(:username, :email, :password, :password_confirmation, :country_id, :city_id)
    end
end
