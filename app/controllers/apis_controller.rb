class ApisController < ApplicationController
  before_action :set_api, only: [:show, :edit, :update, :destroy]

  # GET /apis
  # GET /apis.json
  def index
    #
    #Attractions
    #
    if params[:att]!= nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @attracti=Attraction.where("accessibility=?",true).all
        @attracti.each do |att|
          atrac=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            trans=AttractionTranslation.where("language_id=?",lan.id).where("attraction_id=?",att.id).first
            if trans != nil
              atrac["name"]=trans.name
              atrac["description"]=trans.description
              atrac["schedule"]=trans.schedule
              atrac["transport"]=trans.transport
              atrac["price"]=trans.price
            end
          end
          if att.site!=nil
            atrac["site"]=att.site
          else
            atrac["site"]=""
          end
          if att.email!=nil
            atrac["email"]=att.email
          else
            atrac["email"]=""
          end
          if att.address!=nil
            atrac["address"]=att.address
          else
            atrac["address"]=""
          end
          if att.phone!=nil
            atrac["phone"]=att.phone
          else
            atrac["phone"]=""
          end
          atrac["latitude"]=att.latitude
          atrac["longitude"]=att.longitude
          atrac["timestamp"]=att.timestamp
          atrac["isActive"]=att.active
          atrac["hasAccessibility"]=att.accessibility
          @tmp=Array.new
          att.types.each do |t|
            @tmp.push(t.name)
          end
          atrac["type"]=@tmp
          @tmp_photo=Array.new
          att.photo_attractions.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:8080"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          atrac["rating"]=att.rating
          atrac["isReferencePoint"]=att.reference_point
          atrac["comments"]=att.comment_attractions.all
          @result.push(atrac)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      elsif params[:lang]!=nil
        @result=Array.new
        @attracti=Attraction.all
        @attracti.each do |att|
          atrac=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            trans=AttractionTranslation.where("language_id=?",lan.id).where("attraction_id=?",att.id).first
            if trans != nil
              atrac["name"]=trans.name
              atrac["description"]=trans.description
              atrac["schedule"]=trans.schedule
              atrac["transport"]=trans.transport
              atrac["price"]=trans.price
            end
          end
          if att.site!=nil
            atrac["site"]=att.site
          else
            atrac["site"]=""
          end
          if att.email!=nil
            atrac["email"]=att.email
          else
            atrac["email"]=""
          end
          if att.address!=nil
            atrac["address"]=att.address
          else
            atrac["address"]=""
          end
          if att.phone!=nil
            atrac["phone"]=att.phone
          else
            atrac["phone"]=""
          end
          atrac["latitude"]=att.latitude
          atrac["longitude"]=att.longitude
          atrac["timestamp"]=att.timestamp
          atrac["isActive"]=att.active
          atrac["hasAccessibility"]=att.accessibility
          @tmp=Array.new
          att.types.each do |t|
            @tmp.push(t.name)
          end
          atrac["type"]=@tmp
          @tmp_photo=Array.new
          att.photo_attractions.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:8080"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          atrac["rating"]=att.rating
          atrac["isReferencePoint"]=att.reference_point
          atrac["comments"]=att.comment_attractions.all
          @result.push(atrac)
          atrac=nil
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    #
    #Events
    #
    if params[:evt]!= nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @events=Event.where("accessibility=?",true).all
        @events.each do |eve|
          event=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            trans=EventTranslation.where("language_id=?",lan.id).where("event_id=?",eve.id).first
            if trans != nil
              event["name"]=trans.name
              event["description"]=trans.description
              event["schedule"]=trans.schedule
              event["transport"]=trans.transport
              event["price"]=trans.price
              event["program"]=trans.program
            end
          end
          if eve.site!=nil
            event["site"]=eve.site
          else
            event["site"]=""
          end
          if eve.email!=nil
            event["email"]=eve.email
          else
            event["email"]=""
          end
          if eve.address!=nil
            event["address"]=eve.address
          else
            event["address"]=""
          end
          if eve.phone!=nil
            event["phone"]=eve.phone
          else
            event["phone"]=""
          end
          event["latitude"]=eve.latitude
          event["longitude"]=eve.longitude
          event["source"]=eve.source
          event["start"]=eve.startdate
          event["end"]=eve.enddate
          event["organization"]=eve.organization
          event["timestamp"]=eve.timestamp
          event["isActive"]=eve.active
          event["hasAccessibility"]=eve.accessibility
          @tmp=Array.new
          eve.types.each do |t|
            @tmp.push(t.name)
          end
          event["type"]=@tmp
          @tmp_photo=Array.new
          att.photo_attractions.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:8080"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          event["rating"]=eve.rating
          #event["isReferencePoint"]=eve.reference_point
          event["comments"]=eve.comment_events.all
          @result.push(event)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      elsif params[:lang]!=nil
        @result=Array.new
        @events=Event.all
        @events.each do |eve|
          event=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            trans=EventTranslation.where("language_id=?",lan.id).where("event_id=?",eve.id).first
            if trans != nil
              event["name"]=trans.name
              event["description"]=trans.description
              event["schedule"]=trans.schedule
              event["transport"]=trans.transport
              event["price"]=trans.price
              event["program"]=trans.program
            end
          end
          if eve.site!=nil
            event["site"]=eve.site
          else
            event["site"]=""
          end
          if eve.email!=nil
            event["email"]=eve.email
          else
            event["email"]=""
          end
          if eve.address!=nil
            event["address"]=eve.address
          else
            event["address"]=""
          end
          if eve.phone!=nil
            event["phone"]=eve.phone
          else
            event["phone"]=""
          end
          event["latitude"]=eve.latitude
          event["longitude"]=eve.longitude
          event["source"]=eve.source
          event["organization"]=eve.organization
          event["timestamp"]=eve.timestamp
          event["isActive"]=eve.active
          event["hasAccessibility"]=eve.accessibility
          @tmp=Array.new
          eve.types.each do |t|
            @tmp.push(t.name)
          end
          event["type"]=@tmp
          @tmp_photo=Array.new
          eve.photo_events.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:8080"+p.photo.url(:small,false))
          end
          event["photos"]=@tmp_photo
          event["rating"]=eve.rating
          #event["isReferencePoint"]=eve.reference_point
          event["comments"]=eve.comment_events.all
          @result.push(event)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    if params[:ser]!= nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @servic=Service.where("accessibility=?",true).all
        @servic.each do |ser|
          serv=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            trans=ServiceTranslation.where("language_id=?",lan.id).where("service_id=?",ser.id).first
            if trans != nil
              serv["name"]=trans.name
              serv["description"]=trans.description
              serv["schedule"]=trans.schedule
              serv["transport"]=trans.transport
            end
          end
          if ser.site!=nil
            serv["site"]=ser.site
          else
            serv["site"]=""
          end
          if ser.email!=nil
            serv["email"]=ser.email
          else
            serv["email"]=""
          end
          if ser.address!=nil
            serv["address"]=ser.address
          else
            serv["address"]=""
          end
          if ser.phone!=nil
            serv["phone"]=ser.phone
          else
            serv["phone"]=""
          end
          serv["latitude"]=ser.latitude
          serv["longitude"]=ser.longitude
          serv["source"]=ser.source
          serv["capacity"]=ser.capacity
          serv["details"]=ser.details
          serv["timestamp"]=ser.timestamp
          serv["isActive"]=ser.active
          serv["hasAccessibility"]=ser.accessibility
          serv["type"]=ser.types.all
          @tmp=Array.new
          ser.types.each do |t|
            @tmp.push(t.name)
          end
          serv["type"]=@tmp
          @tmp_photo=Array.new
          ser.photo_services.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:8080"+p.photo.url(:small,false))
          end
          serv["photos"]=@tmp_photo
          serv["rating"]=ser.rating
          serv["isReferencePoint"]=ser.reference_point
          serv["comments"]=ser.comment_services.all
          @result.push(serv)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      elsif params[:lang]!=nil
        @result=Array.new
        @servic=Service.all
        @servic.each do |ser|
          serv=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            trans=ServiceTranslation.where("language_id=?",lan.id).where("service_id=?",ser.id).first
            if trans != nil
              serv["name"]=trans.name
              serv["description"]=trans.description
              serv["schedule"]=trans.schedule
              serv["transport"]=trans.transport
            end
          end
          if ser.site!=nil
            serv["site"]=ser.site
          else
            serv["site"]=""
          end
          if ser.email!=nil
            serv["email"]=ser.email
          else
            serv["email"]=""
          end
          if ser.address!=nil
            serv["address"]=ser.address
          else
            serv["address"]=""
          end
          if ser.phone!=nil
            serv["phone"]=ser.phone
          else
            serv["phone"]=""
          end
          serv["latitude"]=ser.latitude
          serv["longitude"]=ser.longitude
          serv["source"]=ser.source
          serv["capacity"]=ser.capacity
          serv["details"]=ser.details
          serv["timestamp"]=ser.timestamp
          serv["isActive"]=ser.active
          serv["hasAccessibility"]=ser.accessibility
          @tmp=Array.new
          ser.types.each do |t|
            @tmp.push(t.name)
          end
          serv["type"]=@tmp
          @tmp_photo=Array.new
          ser.photo_services.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:8080"+p.photo.url(:small,false))
          end
          serv["photos"]=@tmp_photo
          serv["rating"]=ser.rating
          serv["isReferencePoint"]=ser.reference_point
          serv["comments"]=ser.comment_services.all
          @result.push(serv)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    if params[:iti]!= nil
      @result=Array.new
      @iti=Itinerary.all
      @iti.each do |iti|
        obj=Hash.new
        obj["name"]=iti.name
        obj["description"]=iti.description
        tip=ItineraryType.where("id=?",iti.itinerary_type_id).first
        obj["type"]=tip.name
        
        @pois=Array.new
        #
        #attraction
        #
        @atts=iti.itinerary_attractions
        if @atts.length > 0
          @atts.each do |at|
            point=Hash.new
            point["order"]=at.order
            if params[:lang]!=nil
              t_id=Language.where("abv=?",params[:lang]).first
            else
              t_id=1
            end
            tra=AttractionTranslation.where("language_id=? and attraction_id=?",t_id,at.attraction_id).first
            att=Attraction.where("id=?",at.attraction_id).first
            point["name"]=tra.name
            point["description"]=tra.description
            point["schedule"]=tra.schedule
            point["transport"]=tra.transport
            point["site"]=att.site
            point["address"]=att.address
            point["phone"]=att.phone
            point["latitude"]=att.latitude
            point["longitude"]=att.longitude

            @pois.push(point)
          end
        end
        #
        #events
        #
        @even=iti.itinerary_events
        if @even.length > 0
          @even.each do |evt|
            point=Hash.new
            point["order"]=evt.order
            if params[:lang]!=nil
              t_id=Language.where("abv=?",params[:lang]).first
            else
              t_id=1
            end
            tra=EventTranslation.where("language_id=?",t_id).where("event_id=?",evt.event_id).first
            evtn=Event.where("id=?",evt.event_id).first
            point["name"]=tra.name
            point["description"]=tra.description
            point["schedule"]=tra.schedule
            point["transport"]=tra.transport
            point["site"]=evtn.site
            point["address"]=evtn.address
            point["phone"]=evtn.phone
            point["latitude"]=evtn.latitude
            point["longitude"]=evtn.longitude

            @pois.push(point)
          end
        end
        #
        #Services
        #
        @servi=iti.itinerary_services
        if @servi.length > 0
          @servi.each do |ser|
            point=Hash.new
            point["order"]=ser.order
            if params[:lang]!=nil
              t_id=Language.where("abv=?",params[:lang]).first
            else
              t_id=1
            end
            tra=ServiceTranslation.where("language_id=?",t_id).where("service_id=?",ser.service_id).first
            serv=Service.where("id=?",ser.service_id).first
            point["name"]=tra.name
            point["description"]=tra.description
            point["schedule"]=tra.schedule
            point["transport"]=tra.transport
            point["site"]=serv.site
            point["address"]=serv.address
            point["phone"]=serv.phone
            point["latitude"]=serv.latitude
            point["longitude"]=serv.longitude
            @pois.push(point)
          end
        end
        obj["pois"]=@pois
        @result.push(obj)
      end
      respond_to do |format|
        format.json{ render :json => @result }
      end
    end
  end

  # GET /apis/1
  # GET /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @api = Api.new
  end

  # GET /apis/1/edit
  def edit
  end

  # POST /apis
  # POST /apis.json
  def create
    @api = Api.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to @api, notice: 'Api was successfully created.' }
        format.json { render action: 'show', status: :created, location: @api }
      else
        format.html { render action: 'new' }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1
  # PATCH/PUT /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to @api, notice: 'Api was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api.destroy
    respond_to do |format|
      format.html { redirect_to apis_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_api
    @api = Api.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def api_params
    params[:api]
  end
end
