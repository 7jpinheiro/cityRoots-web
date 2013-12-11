class RatingItinerariesController < ApplicationController
  before_action :set_rating_itinerary, only: [:show, :edit, :update, :destroy]

  # GET /rating_itineraries
  # GET /rating_itineraries.json
  def index
    @rating_itineraries = RatingItinerary.all
  end

  # GET /rating_itineraries/1
  # GET /rating_itineraries/1.json
  def show
  end

  # GET /rating_itineraries/new
  def new
    @rating_itinerary = RatingItinerary.new
  end

  # GET /rating_itineraries/1/edit
  def edit
  end

  # POST /rating_itineraries
  # POST /rating_itineraries.json
  def create
    @rating_itinerary = RatingItinerary.new(rating_itinerary_params)

    respond_to do |format|
      if @rating_itinerary.save
        format.html { redirect_to @rating_itinerary, notice: 'Rating itinerary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rating_itinerary }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating_itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_itineraries/1
  # PATCH/PUT /rating_itineraries/1.json
  def update
    respond_to do |format|
      if @rating_itinerary.update(rating_itinerary_params)
        format.html { redirect_to @rating_itinerary, notice: 'Rating itinerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating_itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_itineraries/1
  # DELETE /rating_itineraries/1.json
  def destroy
    @rating_itinerary.destroy
    respond_to do |format|
      format.html { redirect_to rating_itineraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_itinerary
      @rating_itinerary = RatingItinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_itinerary_params
      params.require(:rating_itinerary).permit(:rating, :evaluationdate, :mobile_user_id, :itinerary_id)
    end
end
