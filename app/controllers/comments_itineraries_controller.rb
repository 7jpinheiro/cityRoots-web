class CommentsItinerariesController < ApplicationController
  before_action :set_comments_itinerary, only: [:show, :edit, :update, :destroy]

  # GET /comments_itineraries
  # GET /comments_itineraries.json
  def index
    @comments_itineraries = CommentsItinerary.all
  end

  # GET /comments_itineraries/1
  # GET /comments_itineraries/1.json
  def show
  end

  # GET /comments_itineraries/new
  def new
    @comments_itinerary = CommentsItinerary.new
  end

  # GET /comments_itineraries/1/edit
  def edit
  end

  # POST /comments_itineraries
  # POST /comments_itineraries.json
  def create
    @comments_itinerary = CommentsItinerary.new(comments_itinerary_params)

    respond_to do |format|
      if @comments_itinerary.save
        format.html { redirect_to @comments_itinerary, notice: 'Comments itinerary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comments_itinerary }
      else
        format.html { render action: 'new' }
        format.json { render json: @comments_itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_itineraries/1
  # PATCH/PUT /comments_itineraries/1.json
  def update
    respond_to do |format|
      if @comments_itinerary.update(comments_itinerary_params)
        format.html { redirect_to @comments_itinerary, notice: 'Comments itinerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comments_itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_itineraries/1
  # DELETE /comments_itineraries/1.json
  def destroy
    @comments_itinerary.destroy
    respond_to do |format|
      format.html { redirect_to comments_itineraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_itinerary
      @comments_itinerary = CommentsItinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_itinerary_params
      params.require(:comments_itinerary).permit(:comment, :evalutiondate, :user_mobile_id, :itinerary_id)
    end
end
