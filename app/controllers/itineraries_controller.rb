class ItinerariesController < ApplicationController
  load_and_authorize_resource
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

  # GET /itineraries
  # GET /itineraries.json
  def index
    @itineraries = current_user.web_user.itinerary if  current_user  && current_user.web_user
    respond_to do |format|
      format.html{}
      format.json{render :json =>  Itinerary.all.as_json( :include => [:events, :attractions,:services]) }
    end
  end

  # GET /itineraries/1
  # GET /itineraries/1.json
  def show
  end

  # GET /itineraries/new
  def new
    @itinerary = Itinerary.new
    1.times{@itinerary.itinerary_attractions.build}
    1.times{@itinerary.itinerary_events.build}
    1.times{@itinerary.itinerary_services.build}
  end

  # GET /itineraries/1/edit
  def edit
  end

  # POST /itineraries
  # POST /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1
  # PATCH/PUT /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:name, :description,:user_id, :itinerary_type_id,itinerary_types_attributes:[:id,:name,:description],rating_itineraries_attributes:[:id,:rating,:evaluationdate,:itinerary_id,:mobile_user_id],comment_itineraries_attributes:[:id,:comment,:evaluationdate,:itinerary_id,:mobile_user_id],itinerary_attractions_attributes:[:id,:order,:itinerary_id,:attraction_id,:_destroy],itinerary_services_attributes:[:id,:order,:itinerary_id,:service_id,:_destroy],itinerary_events_attributes:[:id,:order,:itinerary_id,:event_id,:_destroy])
    end
end
