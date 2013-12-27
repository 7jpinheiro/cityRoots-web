class ItineraryEventsController < ApplicationController
  before_action :set_itinerary_event, only: [:show, :edit, :update, :destroy]

  # GET /itinerary_events
  # GET /itinerary_events.json
  def index
    @itinerary_events = ItineraryEvent.all
  end

  # GET /itinerary_events/1
  # GET /itinerary_events/1.json
  def show
  end

  # GET /itinerary_events/new
  def new
    @itinerary_event = ItineraryEvent.new
  end

  # GET /itinerary_events/1/edit
  def edit
  end

  # POST /itinerary_events
  # POST /itinerary_events.json
  def create
    @itinerary_event = ItineraryEvent.new(itinerary_event_params)

    respond_to do |format|
      if @itinerary_event.save
        format.html { redirect_to @itinerary_event, notice: 'Itinerary event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerary_events/1
  # PATCH/PUT /itinerary_events/1.json
  def update
    respond_to do |format|
      if @itinerary_event.update(itinerary_event_params)
        format.html { redirect_to @itinerary_event, notice: 'Itinerary event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerary_events/1
  # DELETE /itinerary_events/1.json
  def destroy
    @itinerary_event.destroy
    respond_to do |format|
      format.html { redirect_to itinerary_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_event
      @itinerary_event = ItineraryEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_event_params
      params.require(:itinerary_event).permit(:id,:order,:itinerary_id, :event_id)
    end
end
