class LocalEventsController < ApplicationController
  before_action :set_local_event, only: [:show, :edit, :update, :destroy]

  # GET /local_events
  # GET /local_events.json
  def index
    @local_events = LocalEvent.all
  end

  # GET /local_events/1
  # GET /local_events/1.json
  def show
  end

  # GET /local_events/new
  def new
    @local_event = LocalEvent.new
  end

  # GET /local_events/1/edit
  def edit
  end

  # POST /local_events
  # POST /local_events.json
  def create
    @local_event = LocalEvent.new(local_event_params)

    respond_to do |format|
      if @local_event.save
        format.html { redirect_to @local_event, notice: 'Local event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @local_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @local_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_events/1
  # PATCH/PUT /local_events/1.json
  def update
    respond_to do |format|
      if @local_event.update(local_event_params)
        format.html { redirect_to @local_event, notice: 'Local event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_events/1
  # DELETE /local_events/1.json
  def destroy
    @local_event.destroy
    respond_to do |format|
      format.html { redirect_to local_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_event
      @local_event = LocalEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_event_params
      params.require(:local_event).permit(:stardate, :enddate, :organization, :price, :program, :event_type_id)
    end
end
