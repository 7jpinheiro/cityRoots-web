class LocalServicesController < ApplicationController
  before_action :set_local_service, only: [:show, :edit, :update, :destroy]

  # GET /local_services
  # GET /local_services.json
  def index
    @local_services = LocalService.all
  end

  # GET /local_services/1
  # GET /local_services/1.json
  def show
  end

  # GET /local_services/new
  def new
    @local_service = LocalService.new
  end

  # GET /local_services/1/edit
  def edit
  end

  # POST /local_services
  # POST /local_services.json
  def create
    @local_service = LocalService.new(local_service_params)

    respond_to do |format|
      if @local_service.save
        format.html { redirect_to @local_service, notice: 'Local service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @local_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @local_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_services/1
  # PATCH/PUT /local_services/1.json
  def update
    respond_to do |format|
      if @local_service.update(local_service_params)
        format.html { redirect_to @local_service, notice: 'Local service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_services/1
  # DELETE /local_services/1.json
  def destroy
    @local_service.destroy
    respond_to do |format|
      format.html { redirect_to local_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_service
      @local_service = LocalService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_service_params
      params.require(:local_service).permit(:capacity, :details, :service_type_id)
    end
end
