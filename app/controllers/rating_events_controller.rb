class RatingEventsController < ApplicationController
  before_action :set_rating_event, only: [:show, :edit, :update, :destroy]

  # GET /rating_events
  # GET /rating_events.json
  def index
    @rating_events = RatingEvent.all
  end

  # GET /rating_events/1
  # GET /rating_events/1.json
  def show
  end

  # GET /rating_events/new
  def new
    @rating_event = RatingEvent.new
  end

  # GET /rating_events/1/edit
  def edit
  end

  # POST /rating_events
  # POST /rating_events.json
  def create
    @rating_event = RatingEvent.new(rating_event_params)

    respond_to do |format|
      if @rating_event.save
        format.html { redirect_to @rating_event, notice: 'Rating event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rating_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_events/1
  # PATCH/PUT /rating_events/1.json
  def update
    respond_to do |format|
      if @rating_event.update(rating_event_params)
        format.html { redirect_to @rating_event, notice: 'Rating event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_events/1
  # DELETE /rating_events/1.json
  def destroy
    @rating_event.destroy
    respond_to do |format|
      format.html { redirect_to rating_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_event
      @rating_event = RatingEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_event_params
      params.require(:rating_event).permit(:rating, :evaluationdate, :mobile_user_id, :event_id)
    end
end
