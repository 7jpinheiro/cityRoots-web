class PhotoServicesController < ApplicationController
  before_action :set_photo_service, only: [:show, :edit, :update, :destroy]

  # GET /photo_services
  # GET /photo_services.json
  def index
    @photo_services = PhotoService.all
  end

  # GET /photo_services/1
  # GET /photo_services/1.json
  def show
  end

  # GET /photo_services/new
  def new
    @photo_service = PhotoService.new
  end

  # GET /photo_services/1/edit
  def edit
  end

  # POST /photo_services
  # POST /photo_services.json
  def create
    @photo_service = PhotoService.create photo_service_params

    #respond_to do |format|
    #  if @photo_service.save
    #    format.html { redirect_to @photo_service, notice: 'Photo service was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @photo_service }
    #  else
    #    format.html { render action: 'new' }
    #    format.json { render json: @photo_service.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /photo_services/1
  # PATCH/PUT /photo_services/1.json
  def update
    respond_to do |format|
      if @photo_service.update(photo_service_params)
        format.html { redirect_to @photo_service, notice: 'Photo service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_services/1
  # DELETE /photo_services/1.json
  def destroy
    @photo_service.destroy
    respond_to do |format|
      format.html { redirect_to photo_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_service
      @photo_service = PhotoService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_service_params
      params.require(:photo_service).permit(:url, :name, :description, :extension)
    end
end
