class WebUserPacksController < ApplicationController
  before_action :set_web_user_pack, only: [:show, :edit, :update, :destroy]

  # GET /web_user_packs
  # GET /web_user_packs.json
  def index
    @web_user_packs = WebUserPack.all
  end

  # GET /web_user_packs/1
  # GET /web_user_packs/1.json
  def show
  end

  # GET /web_user_packs/new
  def new
    @web_user_pack = WebUserPack.new
  end

  # GET /web_user_packs/1/edit
  def edit
  end

  # POST /web_user_packs
  # POST /web_user_packs.json
  def create
    @web_user_pack = WebUserPack.new(web_user_pack_params)

    respond_to do |format|
      if @web_user_pack.save
        format.html { redirect_to @web_user_pack, notice: 'Pacote de utilizadores web criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @web_user_pack }
      else
        format.html { render action: 'new' }
        format.json { render json: @web_user_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_user_packs/1
  # PATCH/PUT /web_user_packs/1.json
  def update
    respond_to do |format|
      if @web_user_pack.update(web_user_pack_params)
        format.html { redirect_to @web_user_pack, notice: 'Pacote de utilizadores web actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web_user_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_user_packs/1
  # DELETE /web_user_packs/1.json
  def destroy
    @web_user_pack.destroy
    respond_to do |format|
      format.html { redirect_to web_user_packs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_user_pack
      @web_user_pack = WebUserPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_user_pack_params
      params.require(:web_user_pack).permit(:subscriptiondate, :validity, :obs, :active, :pack_type_id, :web_user_id)
    end
end
