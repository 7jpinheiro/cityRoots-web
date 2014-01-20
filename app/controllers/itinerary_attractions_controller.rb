class ItineraryAttractionsController < ApplicationController
  before_action :set_itinerary_attraction, only: [:show, :edit, :update, :destroy]


  # GET /itinerary_attractions
  # GET /itinerary_attractions.json
  def index
    @itinerary_attractions = ItineraryAttraction.all
  end

  # GET /itinerary_attractions/1
  # GET /itinerary_attractions/1.json
  def show4
  end

  # GET /itinerary_attractions/new
  def new
    @itinerary_attraction = ItineraryAttraction.new
  end

  # GET /itinerary_attractions/1/edit
  def edit
  end

  # POST /itinerary_attractions
  # POST /itinerary_attractions.json
  def create
    @itinerary_attraction = ItineraryAttraction.new(itinerary_attraction_params)

    respond_to do |format|
      if @itinerary_attraction.save
        format.html { redirect_to @itinerary_attraction, notice: 'Itinerary attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary_attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerary_attractions/1
  # PATCH/PUT /itinerary_attractions/1.json
  def update
    respond_to do |format|
      if @itinerary_attraction.update(itinerary_attraction_params)
        format.html { redirect_to @itinerary_attraction, notice: 'Itinerary attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerary_attractions/1
  # DELETE /itinerary_attractions/1.json
  def destroy
    @itinerary_attraction.destroy
    respond_to do |format|
      format.html { redirect_to itinerary_attractions_url }
      format.json { head :no_content }
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_attraction
      @itinerary_attraction = ItineraryAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_attraction_params
      params.require(:itinerary_attraction).permit(:id,:order,:itinerary_id, :attraction_id)
    end
end
