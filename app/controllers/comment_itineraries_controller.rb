class CommentItinerariesController < ApplicationController
  before_action :set_comment_itinerary, only: [:show, :edit, :update, :destroy]

  # GET /comment_itineraries
  # GET /comment_itineraries.json
  def index
    @comment_itineraries = CommentItinerary.all
  end

  # GET /comment_itineraries/1
  # GET /comment_itineraries/1.json
  def show
  end

  # GET /comment_itineraries/new
  def new
    @comment_itinerary = CommentItinerary.new
  end

  # GET /comment_itineraries/1/edit
  def edit
  end

  # POST /comment_itineraries
  # POST /comment_itineraries.json
  def create
    @comment_itinerary = CommentItinerary.new(comment_itinerary_params)

    respond_to do |format|
      if @comment_itinerary.save
        format.html { redirect_to @comment_itinerary, notice: 'Comment itinerary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment_itinerary }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment_itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_itineraries/1
  # PATCH/PUT /comment_itineraries/1.json
  def update
    respond_to do |format|
      if @comment_itinerary.update(comment_itinerary_params)
        format.html { redirect_to @comment_itinerary, notice: 'Comment itinerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_itineraries/1
  # DELETE /comment_itineraries/1.json
  def destroy
    @comment_itinerary.destroy
    respond_to do |format|
      format.html { redirect_to comment_itineraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_itinerary
      @comment_itinerary = CommentItinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_itinerary_params
      params.require(:comment_itinerary).permit(:comment, :evalutiondate, :mobile_user_id, :itinerary_id)
    end
end