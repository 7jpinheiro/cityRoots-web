class CommentEventsController < ApplicationController
  before_action :set_comment_event, only: [:show, :edit, :update, :destroy]

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

  
   # GET /comment_events
  # GET /comment_events.json
  def index
    @comment_events = CommentEvent.all
  end

  # GET /comment_events/1
  # GET /comment_events/1.json
  def show
  end

  # GET /comment_events/new
  def new
    @comment_event = CommentEvent.new
  end

  # GET /comment_events/1/edit
  def edit
  end

  # POST /comment_events
  # POST /comment_events.json
  def create
    @comment_event = CommentEvent.new(comment_event_params)

    respond_to do |format|
      if @comment_event.save
        format.html { redirect_to @comment_event, notice: 'Comentário de evento criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @comment_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_events/1
  # PATCH/PUT /comment_events/1.json
  def update
    respond_to do |format|
      if @comment_event.update(comment_event_params)
        format.html { redirect_to @comment_event, notice: 'Comentário de evento actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_events/1
  # DELETE /comment_events/1.json
  def destroy
    @comment_event.destroy
    respond_to do |format|
      format.html { redirect_to comment_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_event
      @comment_event = CommentEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_event_params
      params.require(:comment_event).permit(:comment, :evaluationdate, :mobile_user_id, :event_id)
    end
end
