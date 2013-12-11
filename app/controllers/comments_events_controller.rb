class CommentsEventsController < ApplicationController
  before_action :set_comments_event, only: [:show, :edit, :update, :destroy]

  # GET /comments_events
  # GET /comments_events.json
  def index
    @comments_events = CommentsEvent.all
  end

  # GET /comments_events/1
  # GET /comments_events/1.json
  def show
  end

  # GET /comments_events/new
  def new
    @comments_event = CommentsEvent.new
  end

  # GET /comments_events/1/edit
  def edit
  end

  # POST /comments_events
  # POST /comments_events.json
  def create
    @comments_event = CommentsEvent.new(comments_event_params)

    respond_to do |format|
      if @comments_event.save
        format.html { redirect_to @comments_event, notice: 'Comments event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comments_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @comments_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_events/1
  # PATCH/PUT /comments_events/1.json
  def update
    respond_to do |format|
      if @comments_event.update(comments_event_params)
        format.html { redirect_to @comments_event, notice: 'Comments event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comments_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_events/1
  # DELETE /comments_events/1.json
  def destroy
    @comments_event.destroy
    respond_to do |format|
      format.html { redirect_to comments_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_event
      @comments_event = CommentsEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_event_params
      params.require(:comments_event).permit(:comment, :evalutiondate, :mobile_user_id, :event_id)
    end
end
