class PhotoEventsController < ApplicationController
  before_action :set_photo_event, only: [:show, :edit, :update, :destroy]


  # GET /photo_events
  # GET /photo_events.json
  def index
    @photo_events = PhotoEvent.all
  end

  # GET /photo_events/1
  # GET /photo_events/1.json
  def show
  end

  # GET /photo_events/new
  def new
    @photo_event = PhotoEvent.new
  end

  # GET /photo_events/1/edit
  def edit
  end

  # POST /photo_events
  # POST /photo_events.json
  def create
    @photo_event = PhotoEvent.create photo_event_params

  #  respond_to do |format|
  #    if @photo_event.save
  #      format.html { redirect_to @photo_event, notice: 'Photo event was successfully created.' }
  #      format.json { render action: 'show', status: :created, location: @photo_event }
  #    else
  #      format.html { render action: 'new' }
  #      format.json { render json: @photo_event.errors, status: :unprocessable_entity }
  #    end
  #  end
  end

  # PATCH/PUT /photo_events/1
  # PATCH/PUT /photo_events/1.json
  def update
    respond_to do |format|
      if @photo_event.update(photo_event_params)
        format.html { redirect_to @photo_event, notice: 'Foto de evento actualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_events/1
  # DELETE /photo_events/1.json
  def destroy
    @photo_event.destroy
    respond_to do |format|
      format.html { redirect_to photo_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_event
      @photo_event = PhotoEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_event_params
      params.require(:photo_event).permit(:description, :photo, :event_id)
    end
end
