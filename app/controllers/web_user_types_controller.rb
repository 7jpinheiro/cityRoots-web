class WebUserTypesController < ApplicationController
  before_action :set_web_user_type, only: [:show, :edit, :update, :destroy]

  # GET /web_user_types
  # GET /web_user_types.json
  def index
    @web_user_types = WebUserType.all
  end

  # GET /web_user_types/1
  # GET /web_user_types/1.json
  def show
  end

  # GET /web_user_types/new
  def new
    @web_user_type = WebUserType.new
  end

  # GET /web_user_types/1/edit
  def edit
  end

  # POST /web_user_types
  # POST /web_user_types.json
  def create
    @web_user_type = WebUserType.new(web_user_type_params)

    respond_to do |format|
      if @web_user_type.save
        format.html { redirect_to @web_user_type, notice: 'Tipo de utilizadores web criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @web_user_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @web_user_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_user_types/1
  # PATCH/PUT /web_user_types/1.json
  def update
    respond_to do |format|
      if @web_user_type.update(web_user_type_params)
        format.html { redirect_to @web_user_type, notice: 'Tipo de utilizadores web actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web_user_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_user_types/1
  # DELETE /web_user_types/1.json
  def destroy
    @web_user_type.destroy
    respond_to do |format|
      format.html { redirect_to web_user_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_user_type
      @web_user_type = WebUserType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_user_type_params
      params.require(:web_user_type).permit(:name, :description)
    end
end
