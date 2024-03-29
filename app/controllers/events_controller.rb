class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

  # GET /events
  # GET /events.json
  def index
    if (!params[:search].nil?)
      if (current_user.role? (:admin))
        @events =  Event.joins(:event_translations).where("event_translations.language_id=1 and LOWER(event_translations.name) LIKE LOWER(?)", "%#{params[:search]}%").page(params[:page]).per(10)
      else
        @events =  Event.joins(:event_translations).where("event_translations.language_id=1 and  events.web_user_id=? and LOWER(event_translations.name) LIKE LOWER(?)",current_user.id, "%#{params[:search]}%").page(params[:page]).per(10)
      end
    else
      if (!current_user.nil?) && (current_user.role? (:admin))
        @events = Event.page(params[:page]).per(10)
      else
        @events = current_user.web_user.events.page(params[:page]).per(10) if  current_user  && current_user.web_user
      end
    end
    respond_to do |format|
      format.html{}
      format.json{render :json => Event.page(params[:page]).per(25).as_json({:include=>{:event_translations=>{:include=>:language},:city=>{:include=>:country},:photo_events=>{},:types=>{},:comment_events=>{:include=>:mobile_user}}})}
    end
  end
  # GET /events/1
  # GET /events/1.json
  def show
    @events=Event.find(params[:id])
    respond_to do |format|
      format.html {  render :layout => 'layout_welc'}
      format.json { render :json => @events.as_json(:include => [:event_translations, :comment_events,:photo_events,:city,:types])}
    end
  end

 def gallery
    @photo_events= Event.all
    respond_to do |format|
      format.html { render :layout => 'layout_welc'}
      format.json{}
    end
  end


   #post
  def excel
    uploaded_io = params[:events][:file]
    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    id= current_user.id
    puts path.inspect + "---------------%%%%%%%%%%"
    @result = system("perl #{Rails.root}/lib/genEvents  #{path} -u #{id}")
    
    puts @result.inspect + "---------------%%%%%%%%%%"
    params=nil
    if !@result
           flash[:error] = "Ocorreu um erro ao processar o seu ficheiro, verifique se o ficheiro contem a formatação correta."
    else
           flash[:notice] = "Eventos inseridos com sucesso!"

    end
    redirect_to(events_path)
  end

  # GET /events/new
  def new
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
        format.html { redirect_to @event, notice: 'Evento criado com sucesso.' }
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
        format.html { redirect_to @event, notice: 'Evento actualizado com sucesso.' }
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

  def autocomplete_event_name

    if (!current_user.nil?) && (current_user.role? (:admin))
      events = EventTranslation.where("language_id=1 and LOWER(name) LIKE LOWER(?)","#{params[:name]}%")
    else
      
      events = EventTranslation.joins('LEFT OUTER JOIN events ON "event_translations"."event_id" = "events"."id"').where("event_translations.language_id=1 and events.web_user_id=? and LOWER(event_translations.name) LIKE LOWER(?)", current_user.id,"#{params[:name]}%")
    end
    result = events.collect do |t|
      { value: t.name }
    end
    render json: result
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
