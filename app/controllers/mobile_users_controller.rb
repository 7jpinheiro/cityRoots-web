class MobileUsersController < ApplicationController
  before_action :set_mobile_user, only: [:show, :edit, :update, :destroy]

 
  # GET /mobile_users
  # GET /mobile_users.json
  def index
    @mobile_users = MobileUser.all
  end

  # GET /mobile_users/1
  # GET /mobile_users/1.json
  def show
  end

  # GET /mobile_users/new
  def new
    @mobile_user = MobileUser.new
  end

  # GET /mobile_users/1/edit
  def edit
  end

  # POST /mobile_users
  # POST /mobile_users.json
  def create
    @mobile_user = MobileUser.new(mobile_user_params)

    respond_to do |format|
      if @mobile_user.save
        format.html { redirect_to @mobile_user, notice: 'Utilizador mobile criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @mobile_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @mobile_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobile_users/1
  # PATCH/PUT /mobile_users/1.json
  def update
    respond_to do |format|
      if @mobile_user.update(mobile_user_params)
        format.html { redirect_to @mobile_user, notice: 'Utilizador mobile actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mobile_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_users/1
  # DELETE /mobile_users/1.json
  def destroy
    @mobile_user.destroy
    respond_to do |format|
      format.html { redirect_to mobile_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobile_user
      @mobile_user = MobileUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mobile_user_params
      params.require(:mobile_user).permit(:username, :active, :country_id, :email, :pass, :dateofbirth, :firstname, :surname, :gender, :language_id, :country_id)
    end
end
