class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  # GET /services
  # GET /services.json
  def index
    @services = current_user.web_user.services
    respond_to do |format|
      format.html{}
      format.json{render :json => Service.all.as_json( :include => [:service_translations,:photo_services,:city,:types]) }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service=Service.find(params[:id])
    respond_to do |format|
      format.html { @service }
      format.json { render :json => @service.as_json( :include => [:service_translations,:photo_services,:city,:types]) }
    end
  end

  # GET /services/new
  def new
    @service = Service.new
    1.times{@service.photo_services.build}
    1.times{@service.service_translations.build}
    1.times{@service.service_types.build}
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @service }
      else
        format.html { render action: 'new' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(
          :site,
          :email,
          :address,
          :latitude,
          :longitude,
          :reference_point,
          :active,
          :timestamp,
          :capacity,
          :details,
          :rating,
          :accessibility,
          :city_id,
          :web_user_id,
          service_types_attributes:[
              :id,
              :service_id,
              :type_id,
              :_destroy
          ],
          service_translations_attributes:[
              :id,
              :name,
              :schedule,
              :language_id,
              :description,
              :transport,
              :service_id,
              :_destroy
          ]
      )
    end
end
