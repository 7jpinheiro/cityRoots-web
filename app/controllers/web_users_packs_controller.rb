class WebUsersPacksController < ApplicationController
  before_action :set_web_users_pack, only: [:show, :edit, :update, :destroy]

  # GET /web_users_packs
  # GET /web_users_packs.json
  def index
    @web_users_packs = WebUsersPack.all
  end

  # GET /web_users_packs/1
  # GET /web_users_packs/1.json
  def show
  end

  # GET /web_users_packs/new
  def new
    @web_users_pack = WebUsersPack.new
  end

  # GET /web_users_packs/1/edit
  def edit
  end

  # POST /web_users_packs
  # POST /web_users_packs.json
  def create
    @web_users_pack = WebUsersPack.new(web_users_pack_params)

    respond_to do |format|
      if @web_users_pack.save
        format.html { redirect_to @web_users_pack, notice: 'Web users pack was successfully created.' }
        format.json { render action: 'show', status: :created, location: @web_users_pack }
      else
        format.html { render action: 'new' }
        format.json { render json: @web_users_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_users_packs/1
  # PATCH/PUT /web_users_packs/1.json
  def update
    respond_to do |format|
      if @web_users_pack.update(web_users_pack_params)
        format.html { redirect_to @web_users_pack, notice: 'Web users pack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @web_users_pack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_users_packs/1
  # DELETE /web_users_packs/1.json
  def destroy
    @web_users_pack.destroy
    respond_to do |format|
      format.html { redirect_to web_users_packs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_users_pack
      @web_users_pack = WebUsersPack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def web_users_pack_params
      params.require(:web_users_pack).permit(:subscriptiondate, :validity, :obs, :active, :pack_type_id, :web_user_id)
    end
end
