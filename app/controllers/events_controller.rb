class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  # GET /events
  # GET /events.json
  def index

    @events = current_user.web_user.events if  current_user  && current_user.web_user
    respond_to do |format|
      format.html{}
      format.json{render :json => Event.all.as_json( :include => [:event_translations, :comment_events,:photo_events,:city,:types]) }
    end
  end
  # GET /events/1
  # GET /events/1.json
  def show
    @events=Event.find(params[:id])
    respond_to do |format|
      format.html { @events }
      format.json { render :json => @events.as_json(:include => [:event_translations, :comment_events,:photo_events,:city,:types])}
    end
  end

  # GET /events/new
  def new
    add_crumb "Novo", ""
    @event = Event.new
    1.times{@event.event_translations.build}
    1.times{@event.event_types.build}
  end

  # GET /events/1/edit
  def edit
    @events=Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. 
    def event_params
      params.require(:event).permit(
          :id,
          :site,
          :email,
          :address,
          :phone,
          :latitude,
          :longitude,
          :startdate,
          :enddate,
          :organization,
          :source,
          :rating,
          :photo_events,
          :accessibility,
          :city_id,
          :timestamp,
          :active,
          :web_user_id,
          event_types_attributes:[
              :id,
              :event_id,
              :type_id,
              :_destroy
          ],
          event_translations_attributes: [
              :id,
              :name,
              :schedule,
              :price,
              :language_id,
              :program,
              :description,
              :transport,
              :event_id,
              :_destroy
          ],
          photo_events_attributes: [:id,:name,:photo_file_name,:photo_content_type,:photo_file_size,:photo_updated_at,:description,:image,:event_id, :_destroy])
    end

end
