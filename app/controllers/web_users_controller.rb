class WebUsersController < ApplicationController
  before_action :set_web_user, only: [:show, :edit, :update, :destroy]


  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

  # GET /web_users
  # GET /web_users.json
  def index
    @web_users = WebUser.all
  end

  # GET /web_users/1
  # GET /web_users/1.json
  def show
  end

  # GET /web_users/new
  def new
    @web_user = WebUser.new
    current_user.create_list_roles
  end

  # GET /web_users/1/edit
  def edit
  end

  # POST /web_users
  # POST /web_users.json
  def create
    @web_user = WebUser.new(web_user_params)

    respond_to do |format|
      if @web_user.save
        format.html { redirect_to profiles_index_path , notice: 'Completou com sucesso o seu registo.' }
        format.json { render action: 'show', status: :created, location: @web_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @web_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_users/1
  # PATCH/PUT /web_users/1.json
  def update
    puts "jkfvhdfhgjhghjgfghjfgfhjhgjf"
    respond_to do |format|
      if @web_user.update(web_user_params)
        puts "entra aqui"
        format.html { redirect_to profiles_index_path, notice: 'Perfil actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_users/1
  # DELETE /web_users/1.json
  def destroy
    @web_user.destroy
    respond_to do |format|
      format.html { redirect_to web_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_user
      @web_user = WebUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_user_params
      params.require(:web_user).permit(:name, :id, :nif, :address, :active, :web_user_type_id, :city_id)
    end
end
