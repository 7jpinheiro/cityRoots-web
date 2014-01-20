class ItineraryServicesController < ApplicationController
  before_action :set_itinerary_service, only: [:show, :edit, :update, :destroy]

  # GET /itinerary_services
  # GET /itinerary_services.json
  def index
    @itinerary_services = ItineraryService.all
  end

  # GET /itinerary_services/1
  # GET /itinerary_services/1.json
  def show
  end

  # GET /itinerary_services/new
  def new
    @itinerary_service = ItineraryService.new
  end

  # GET /itinerary_services/1/edit
  def edit
  end

  # POST /itinerary_services
  # POST /itinerary_services.json
  def create
    @itinerary_service = ItineraryService.new(itinerary_service_params)

    respond_to do |format|
      if @itinerary_service.save
        format.html { redirect_to @itinerary_service, notice: 'Itinerary service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerary_services/1
  # PATCH/PUT /itinerary_services/1.json
  def update
    respond_to do |format|
      if @itinerary_service.update(itinerary_service_params)
        format.html { redirect_to @itinerary_service, notice: 'Itinerary service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerary_services/1
  # DELETE /itinerary_services/1.json
  def destroy
    @itinerary_service.destroy
    respond_to do |format|
      format.html { redirect_to itinerary_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_service
      @itinerary_service = ItineraryService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_service_params
      params.require(:itinerary_service).permit(:id,:order,:itinerary_id, :service_id)
    end
end
