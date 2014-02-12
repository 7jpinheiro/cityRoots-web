class ApisController < ApplicationController
  before_action  only: [:show, :edit, :update, :destroy]

  #before_filter :restrict_access

  # GET /apis
  # GET /apis.json
  def index

    if params[:id]!=nil && params[:att]!= nil
        atrac=Hash.new
        att=Attraction.where("id=?",params[:id]).first
        atrac["id"]=params[:id]
        if params[:lang]!=nil
          t_id=Language.where("abv=?",params[:lang]).first
        else
          t_id=1
        end
        trans=AttractionTranslation.where("language_id=?",t_id).where("attraction_id=?",att.id).first
        if trans != nil
          atrac["name"]=trans.name
          atrac["description"]=trans.description
          atrac["schedule"]=trans.schedule
          atrac["transport"]=trans.transport
          atrac["price"]=trans.price
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
          @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
        end
        atrac["photos"]=@tmp_photo
        atrac["rating"]=att.rating
        atrac["isReferencePoint"]=att.reference_point
        @tmp_com=Array.new
        att.comment_attractions.all.each do |c|
          com=Hash.new
          com["comment"]=c.comment
          com["date"]=c.evaluationdate
          use=User.where("id=?",c.mobile_user_id).first
          com["username"]=use.username
          @tmp_com.push(com)
        end
        atrac["comments"]=@tmp_com
        respond_to do |format|
          format.json{ render :json => atrac }
        end
    end
    if params[:id]!=nil && params[:evt]!= nil
        event=Hash.new
        eve=Event.where("id=?",params[:id]).first
        event["id"]=params[:id]
        if params[:lang]!=nil
          t_id=Language.where("abv=?",params[:lang]).first
        else
          t_id=1
        end
        trans=EventTranslation.where("language_id=?",t_id).where("event_id=?",eve.id).first
        if trans != nil
          event["name"]=trans.name
          event["description"]=trans.description
          event["schedule"]=trans.schedule
          event["transport"]=trans.transport
          event["price"]=trans.price
          event["program"]=trans.program
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
        eve.photo_events.all.each do |p|
          @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
        end
        event["photos"]=@tmp_photo
        event["rating"]=eve.rating
        #event["isReferencePoint"]=eve.reference_point
        @tmp_com=Array.new
        eve.comment_events.all.each do |c|
          com=Hash.new
          com["comment"]=c.comment
          com["date"]=c.evaluationdate
          use=User.where("id=?",c.mobile_user_id).first
          com["username"]=use.username
          @tmp_com.push(com)
        end
        event["comments"]=@tmp_com
        respond_to do |format|
          format.json{ render :json => event }
        end

    end

    if params[:id]!=nil && params[:ser]!= nil
        serv=Hash.new
        ser=Service.where("id=?",params[:id]).first
        if ser == nil
          respond_to do |format|
            format.json{  nil }
          end
        end
        serv["id"]=params[:id]
        if params[:lang]!=nil
          t_id=Language.where("abv=?",params[:lang]).first
        else
          t_id=1
        end
        trans=ServiceTranslation.where("language_id=?",t_id).where("service_id=?",ser.id).first
        if trans != nil
          serv["name"]=trans.name
          serv["description"]=trans.description
          serv["schedule"]=trans.schedule
          serv["transport"]=trans.transport
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
          @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
        end
        serv["photos"]=@tmp_photo
        serv["rating"]=ser.rating
        serv["isReferencePoint"]=ser.reference_point
        @tmp_com=Array.new
        ser.comment_services.all.each do |c|
          com=Hash.new
          com["comment"]=c.comment
          com["date"]=c.evaluationdate
          use=User.where("id=?",c.mobile_user_id).first
          com["username"]=use.username
          @tmp_com.push(com)
        end
        serv["comments"]=@tmp_com
        respond_to do |format|
          format.json{ render :json => serv }
        end
    end

    #
    #Attractions
    #
    if params[:att]!= nil && params[:id]==nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @attracti=Attraction.where("accessibility=?",true).all
        @attracti.each do |att|
          atrac=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            atrac["id"]=att.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          atrac["rating"]=att.rating
          atrac["isReferencePoint"]=att.reference_point
          @tmp_com=Array.new
          att.comment_attractions.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          atrac["comments"]=@tmp_com
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
          atrac["id"]=att.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          atrac["rating"]=att.rating
          atrac["isReferencePoint"]=att.reference_point
          @tmp_com=Array.new
          att.comment_attractions.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          atrac["comments"]=@tmp_com
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
    if params[:evt]!= nil && params[:id]==nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @events=Event.where("accessibility=?",true).all
        @events.each do |eve|
          event=Hash.new
          event["id"]=eve.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          event["rating"]=eve.rating
          #event["isReferencePoint"]=eve.reference_point
          @tmp_com=Array.new
          eve.comment_events.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          event["comments"]=@tmp_com
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
          event["id"]=eve.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          event["photos"]=@tmp_photo
          event["rating"]=eve.rating
          #event["isReferencePoint"]=eve.reference_point
          @tmp_com=Array.new
          eve.comment_events.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          event["comments"]=@tmp_com

          @result.push(event)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    if params[:ser]!= nil && params[:id]==nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @servic=Service.where("accessibility=?",true).all
        @servic.each do |ser|
          serv=Hash.new
          serv["id"]=ser.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          serv["photos"]=@tmp_photo
          serv["rating"]=ser.rating
          serv["isReferencePoint"]=ser.reference_point
          @tmp_com=Array.new
          ser.comment_services.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          serv["comments"]=@tmp_com
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
          serv["id"]=ser.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          serv["photos"]=@tmp_photo
          serv["rating"]=ser.rating
          serv["isReferencePoint"]=ser.reference_point
          @tmp_com=Array.new
          ser.comment_services.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          serv["comments"]=@tmp_com
          @result.push(serv)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    if params[:iti]!= nil && params[:id]==nil
      @result=Array.new
      @iti=Itinerary.all
      @iti.each do |iti|
        obj=Hash.new
        obj["id"]=iti.id
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
            point["id"]=at.attraction_id
            point["name"]=tra.name
            point["description"]=tra.description
            point["schedule"]=tra.schedule
            point["transport"]=tra.transport
            point["site"]=att.site
            point["email"]=att.email
            point["address"]=att.address
            point["phone"]=att.phone
            point["latitude"]=att.latitude
            point["longitude"]=att.longitude
            point["isActive"]=att.active
            point["timestamp"]=att.timestamp
            point["hasAccessibily"]=att.accessibility
            point["rating"]=att.rating
            @tmp=Array.new
            att.types.each do |t|
              @tmp.push(t.name)
            end
            point["type"]=@tmp
            @tmp_photo=Array.new
            att.photo_attractions.all.each do |p|
              @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
            end
            point["photos"]=@tmp_photo
            @tmp_com=Array.new
            att.comment_attractions.all.each do |c|
              com=Hash.new
              com["comment"]=c.comment
              com["date"]=c.evaluationdate
              use=User.where("id=?",c.mobile_user_id).first
              com["username"]=use.username
              @tmp_com.push(com)
            end
            point["comments"]=@tmp_com
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
            point["id"]=evt.event_id
            point["poi_type"]=1
            point["name"]=tra.name
            point["description"]=tra.description
            point["schedule"]=tra.schedule
            point["transport"]=tra.transport
            point["site"]=evtn.site
            point["email"]=evtn.email
            point["address"]=evtn.address
            point["phone"]=evtn.phone
            point["latitude"]=evtn.latitude
            point["longitude"]=evtn.longitude
            point["isActive"]=evtn.active
            point["timestamp"]=evtn.timestamp
            point["hasAccessibily"]=evtn.accessibility
            point["rating"]=evtn.rating
            @tmp=Array.new
            evtn.types.each do |t|
              @tmp.push(t.name)
            end
            point["type"]=@tmp
            @tmp_photo=Array.new
            evtn.photo_events.all.each do |p|
              @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
            end
            point["photos"]=@tmp_photo
            @tmp_com=Array.new
            evtn.comment_events.all.each do |c|
              com=Hash.new
              com["comment"]=c.comment
              com["date"]=c.evaluationdate
              use=User.where("id=?",c.mobile_user_id).first
              com["username"]=use.username
              @tmp_com.push(com)
            end
            point["comments"]=@tmp_com
            @pois.push(point)
          end
        end
        #
        #services
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
            point["id"]=ser.service_id
            point["poi_type"]=2
            point["name"]=tra.name
            point["description"]=tra.description
            point["schedule"]=tra.schedule
            point["transport"]=tra.transport
            point["site"]=serv.site
            point["email"]=serv.email
            point["address"]=serv.address
            point["phone"]=serv.phone
            point["latitude"]=serv.latitude
            point["longitude"]=serv.longitude
            point["isActive"]=serv.active
            point["timestamp"]=serv.timestamp
            point["hasAccessibily"]=serv.accessibility
            point["rating"]=serv.rating
            @tmp=Array.new
            serv.types.each do |t|
              @tmp.push(t.name)
            end
            point["type"]=@tmp
            @tmp_photo=Array.new
            serv.photo_services.all.each do |p|
              @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
            end
            point["photos"]=@tmp_photo
            @tmp_com=Array.new
            serv.comment_services.all.each do |c|
              com=Hash.new
              com["comment"]=c.comment
              com["date"]=c.evaluationdate
              use=User.where("id=?",c.mobile_user_id).first
              com["username"]=use.username
              @tmp_com.push(com)
            end
            point["comments"]=@tmp_com
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
    if params[:co]!=nil && params[:attr]
      @com=CommentAttraction.new
      @com.comment=params[:comentario]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Attraction.where("id=?",params[:id]).first
      @com.attraction=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @com.save()

      respond_to do |format|
        format.json {  render :json => Hash.new("success"=>"true") }
      end
    end
    if params[:co]!=nil && params[:even]
      @com=CommentEvent.new
      @com.comment=params[:comentario]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Event.where("id=?",params[:id]).first
      @com.event=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @com.save()
      respond_to do |format|
        format.json {  render :json => Hash.new("success"=>"true") }
      end
    end
    if params[:co]!=nil && params[:serv]
      @com=CommentService.new
      @com.comment=params[:comentario]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Service.where("id=?",params[:id]).first
      @com.event=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @com.save()
      respond_to do |format|
        format.json {  render :json => Hash.new("success"=>"true") }
      end
    end
    if params[:co]!=nil && params[:itin]
      @com=CommentItinerary.new
      @com.comment=params[:comentario]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Itinerary.where("id=?",params[:id]).first
      @com.event=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @com.save()
      respond_to do |format|
        format.json {  render :json => Hash.new("success"=>"true") }
      end
    end
    #
    #Anuncios
    #
    if params[:anun]!=nil
      if params[:lang]!=nil
        t_id=Language.where("abv=?",params[:lang]).first
      else
        t_id=1
      end
      @result=Array.new
      WebUser.where("web_user_type_id=?",2).all.each do |use|
        Event.where("web_user_id=?",use.id).all.each do |anun|
          event=Hash.new
          event["id"]=anun.id

          trans=EventTranslation.where("language_id=?",t_id).where("event_id=?",anun.id).first
          if trans != nil
            event["name"]=trans.name
            event["description"]=trans.description
            event["schedule"]=trans.schedule
            event["transport"]=trans.transport
            event["price"]=trans.price
            event["program"]=trans.program
          end

          if anun.site!=nil
            event["site"]=anun.site
          else
            event["site"]=""
          end
          if anun.email!=nil
            event["email"]=anun.email
          else
            event["email"]=""
          end
          if anun.address!=nil
            event["address"]=anun.address
          else
            event["address"]=""
          end
          if anun.phone!=nil
            event["phone"]=anun.phone
          else
            event["phone"]=""
          end
          event["latitude"]=anun.latitude
          event["longitude"]=anun.longitude
          event["source"]=anun.source
          event["organization"]=anun.organization
          event["timestamp"]=anun.timestamp
          event["isActive"]=anun.active
          event["hasAccessibility"]=anun.accessibility
          @tmp=Array.new
          anun.types.each do |t|
            @tmp.push(t.name)
          end
          event["type"]=@tmp
          @tmp_photo=Array.new
          anun.photo_events.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          event["photos"]=@tmp_photo
          event["rating"]=anun.rating
          #event["isReferencePoint"]=eve.reference_point
          @tmp_com=Array.new
          anun.comment_events.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          event["comments"]=@tmp_com
          @result.push(event)
        end
      end
      respond_to do |format|
        format.json {  render :json => @result }
      end
    end
    if params[:registar]!= nil
      @user=User.new
      @user.email=params[:email]
      @user.username=params[:username]
      @user.password=params[:password]
      @user.password_confirmation=params[:password]
      @user.language_id = 1
      @user.country_id = 188
      @mobile_user = MobileUser.new
      @mobile_user.firstname=params[:firstname]
      @mobile_user.surname=params[:surname]
      @mobile_user.gender=params[:gender]
      @mobile_user.active=true
      @mobile_user.dateofbirth=params[:dateofbirth]

      @user.valid?
      @mobile_user.valid?

      if @user.errors.blank?
        @user.save
        @mobile_user.id = @user.id
        @mobile_user.save
        hash=Hash.new
        hash["id"]=@user.id
        respond_to do |format|
          format.json {  render :json => hash }
        end
      else
        respond_to do |format|
          format.json {  render :json => nil }
        end
      end
    end

    if params[:login]!= nil
      user=User.where("username=?",params[:username]).where("password=?",params[:password]).first
      if user!=nil
        hash=Hash.new
        hash["id"]=user.id
        respond_to do |format|
          format.json {  render :json => hash }
        end
      else
        respond_to do |format|
          format.json {  render :json => nil }
        end
      end
    end
  end

  # GET /apis/1
  # GET /apis/1.json
  def show

    if params[:id]!=nil && params[:att]!= nil
      atrac=Hash.new
      att=Attraction.where("id=?",params[:id]).first
      atrac["id"]=params[:id]
      if params[:lang]!=nil
        t_id=Language.where("abv=?",params[:lang]).first
      else
        t_id=1
      end
      trans=AttractionTranslation.where("language_id=?",t_id).where("attraction_id=?",att.id).first
      if trans != nil
        atrac["name"]=trans.name
        atrac["description"]=trans.description
        atrac["schedule"]=trans.schedule
        atrac["transport"]=trans.transport
        atrac["price"]=trans.price
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
        @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
      end
      atrac["photos"]=@tmp_photo
      atrac["rating"]=att.rating
      atrac["isReferencePoint"]=att.reference_point
      @tmp_com=Array.new
      att.comment_attractions.all.each do |c|
        com=Hash.new
        com["comment"]=c.comment
        com["date"]=c.evaluationdate
        use=MobileUser.where("id=?",c.mobile_user_id).first
        com["username"]=use.firstname+" "+use.surname
        @tmp_com.push(com)
      end
      atrac["comments"]=@tmp_com
      respond_to do |format|
        format.json{ render :json => atrac }
      end
    end
    if params[:id]!=nil && params[:evt]!= nil
      event=Hash.new
      eve=Event.where("id=?",params[:id]).first
      event["id"]=params[:id]
      if params[:lang]!=nil
        t_id=Language.where("abv=?",params[:lang]).first
      else
        t_id=1
      end
      trans=EventTranslation.where("language_id=?",t_id).where("event_id=?",eve.id).first
      if trans != nil
        event["name"]=trans.name
        event["description"]=trans.description
        event["schedule"]=trans.schedule
        event["transport"]=trans.transport
        event["price"]=trans.price
        event["program"]=trans.program
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
      eve.photo_events.all.each do |p|
        @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
      end
      event["photos"]=@tmp_photo
      event["rating"]=eve.rating
      #event["isReferencePoint"]=eve.reference_point
      @tmp_com=Array.new
      eve.comment_events.all.each do |c|
        com=Hash.new
        com["comment"]=c.comment
        com["date"]=c.evaluationdate
        use=MobileUser.where("id=?",c.mobile_user_id).first
        com["username"]=use.firstname+" "+use.surname
        @tmp_com.push(com)
      end
      event["comments"]=@tmp_com
      respond_to do |format|
        format.json{ render :json => event }
      end

    end

    if params[:id]!=nil && params[:ser]!= nil
      serv=Hash.new
      ser=Service.where("id=?",params[:id]).first
      if ser == nil
        respond_to do |format|
          format.json{  nil }
        end
      end
      serv["id"]=params[:id]
      if params[:lang]!=nil
        t_id=Language.where("abv=?",params[:lang]).first
      else
        t_id=1
      end
      trans=ServiceTranslation.where("language_id=?",t_id).where("service_id=?",ser.id).first
      if trans != nil
        serv["name"]=trans.name
        serv["description"]=trans.description
        serv["schedule"]=trans.schedule
        serv["transport"]=trans.transport
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
        @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
      end
      serv["photos"]=@tmp_photo
      serv["rating"]=ser.rating
      serv["isReferencePoint"]=ser.reference_point
      @tmp_com=Array.new
      ser.comment_services.all.each do |c|
        com=Hash.new
        com["comment"]=c.comment
        com["date"]=c.evaluationdate
        use=MobileUser.where("id=?",c.mobile_user_id).first
        com["username"]=use.firstname+" "+use.surname
        @tmp_com.push(com)
      end
      serv["comments"]=@tmp_com
      respond_to do |format|
        format.json{ render :json => serv }
      end
    end

    #
    #Attractions
    #
    if params[:att]!= nil && params[:id]==nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @attracti=Attraction.where("accessibility=?",true).all
        @attracti.each do |att|
          atrac=Hash.new
          lan=Language.where("abv=?",params[:lang]).first
          if lan!= nil
            atrac["id"]=att.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          atrac["rating"]=att.rating
          atrac["isReferencePoint"]=att.reference_point
          @tmp_com=Array.new
          att.comment_attractions.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=MobileUser.where("id=?",c.mobile_user_id).first
            com["username"]=use.firstname+" "+use.surname
            @tmp_com.push(com)
          end
          atrac["comments"]=@tmp_com
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
          atrac["id"]=att.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          atrac["rating"]=att.rating
          atrac["isReferencePoint"]=att.reference_point
          @tmp_com=Array.new
          att.comment_attractions.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=MobileUser.where("id=?",c.mobile_user_id).first
            com["username"]=use.firstname+" "+use.surname
            @tmp_com.push(com)
          end
          atrac["comments"]=@tmp_com
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
    if params[:evt]!= nil && params[:id]==nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @events=Event.where("accessibility=?",true).all
        @events.each do |eve|
          event=Hash.new
          event["id"]=eve.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          atrac["photos"]=@tmp_photo
          event["rating"]=eve.rating
          #event["isReferencePoint"]=eve.reference_point
          @tmp_com=Array.new
          eve.comment_events.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=MobileUser.where("id=?",c.mobile_user_id).first
            com["username"]=use.firstname+" "+use.surname
            @tmp_com.push(com)
          end
          event["comments"]=@tmp_com
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
          event["id"]=eve.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          event["photos"]=@tmp_photo
          event["rating"]=eve.rating
          #event["isReferencePoint"]=eve.reference_point
          @tmp_com=Array.new
          eve.comment_events.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=MobileUser.where("id=?",c.mobile_user_id).first
            com["username"]=use.firstname+" "+use.surname
            @tmp_com.push(com)
          end
          event["comments"]=@tmp_com

          @result.push(event)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    if params[:ser]!= nil && params[:id]==nil
      if params[:lang]!=nil && params[:acc]!=nil
        @result=Array.new
        @servic=Service.where("accessibility=?",true).all
        @servic.each do |ser|
          serv=Hash.new
          serv["id"]=ser.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          serv["photos"]=@tmp_photo
          serv["rating"]=ser.rating
          serv["isReferencePoint"]=ser.reference_point
          @tmp_com=Array.new
          ser.comment_services.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=MobileUser.where("id=?",c.mobile_user_id).first
            com["username"]=use.firstname+" "+use.surname
            @tmp_com.push(com)
          end
          serv["comments"]=@tmp_com
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
          serv["id"]=ser.id
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
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          serv["photos"]=@tmp_photo
          serv["rating"]=ser.rating
          serv["isReferencePoint"]=ser.reference_point
          @tmp_com=Array.new
          ser.comment_services.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=MobileUser.where("id=?",c.mobile_user_id).first
            com["username"]=use.firstname+" "+use.surname
            @tmp_com.push(com)
          end
          serv["comments"]=@tmp_com
          @result.push(serv)
        end
        respond_to do |format|
          format.json{ render :json => @result }
        end
      end
    end
    if params[:iti]!= nil && params[:id]==nil
      @result=Array.new
      @iti=Itinerary.all
      @iti.each do |iti|
        obj=Hash.new
        obj["id"]=iti.id
        obj["name"]=iti.name
        obj["description"]=iti.description
        tip=ItineraryType.where("id=?",iti.itinerary_type_id).first
        obj["type"]=tip.name

        @attractions=Array.new
        #
        #attraction
        #
        @atts=iti.itinerary_attractions
        if @atts.length > 0
          @atts.each do |at|
            point=Hash.new
            point["order"]=at.order
            poi=Hash.new
            if params[:lang]!=nil
              t_id=Language.where("abv=?",params[:lang]).first
            else
              t_id=1
            end
            tra=AttractionTranslation.where("language_id=? and attraction_id=?",t_id,at.attraction_id).first
            att=Attraction.where("id=?",at.attraction_id).first
            poi["id"]=at.attraction_id
            poi["name"]=tra.name
            poi["description"]=tra.description
            poi["schedule"]=tra.schedule
            poi["transport"]=tra.transport
            poi["price"]=tra.price
            poi["site"]=att.site
            poi["source"]=att.source
            poi["email"]=att.email
            poi["address"]=att.address
            poi["phone"]=att.phone
            poi["latitude"]=att.latitude
            poi["longitude"]=att.longitude
            poi["isActive"]=att.active
            poi["timestamp"]=att.timestamp
            poi["hasAccessibily"]=att.accessibility
            poi["rating"]=att.rating
            @tmp=Array.new
            att.types.each do |t|
              @tmp.push(t.name)
            end
            poi["type"]=@tmp
            @tmp_photo=Array.new
            att.photo_attractions.all.each do |p|
              @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
            end
            poi["photos"]=@tmp_photo
            @tmp_com=Array.new
            att.comment_attractions.all.each do |c|
              com=Hash.new
              com["comment"]=c.comment
              com["date"]=c.evaluationdate
              use=MobileUser.where("id=?",c.mobile_user_id).first
              com["username"]=use.firstname+" "+use.surname
              @tmp_com.push(com)
            end
            poi["comments"]=@tmp_com
            point["attraction"]=poi
            @attractions.push(point)
          end
        end
        obj["attractions"]=@attractions
        @events=Array.new
        #
        #events
        #
        @even=iti.itinerary_events
        if @even.length > 0
          @even.each do |evt|
            point=Hash.new
            point["order"]=evt.order
            poi=Hash.new
            if params[:lang]!=nil
              t_id=Language.where("abv=?",params[:lang]).first
            else
              t_id=1
            end
            tra=EventTranslation.where("language_id=?",t_id).where("event_id=?",evt.event_id).first
            evtn=Event.where("id=?",evt.event_id).first
            poi["id"]=evt.event_id
            poi["poi_type"]=1
            poi["name"]=tra.name
            poi["description"]=tra.description
            poi["schedule"]=tra.schedule
            poi["transport"]=tra.transport
            poi["price"]=tra.price
            poi["program"]=tra.program
            poi["site"]=evtn.site
            poi["source"]=evtn.source
            poi["organization"]=evtn.organization
            poi["email"]=evtn.email
            poi["address"]=evtn.address
            poi["phone"]=evtn.phone
            poi["latitude"]=evtn.latitude
            poi["longitude"]=evtn.longitude
            poi["isActive"]=evtn.active
            poi["timestamp"]=evtn.timestamp
            poi["hasAccessibily"]=evtn.accessibility
            poi["rating"]=evtn.rating
            @tmp=Array.new
            evtn.types.each do |t|
              @tmp.push(t.name)
            end
            poi["type"]=@tmp
            @tmp_photo=Array.new
            evtn.photo_events.all.each do |p|
              @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
            end
            poi["photos"]=@tmp_photo
            @tmp_com=Array.new
            evtn.comment_events.all.each do |c|
              com=Hash.new
              com["comment"]=c.comment
              com["date"]=c.evaluationdate
              use=MobileUser.where("id=?",c.mobile_user_id).first
              com["username"]=use.firstname+" "+use.surname
              @tmp_com.push(com)
            end
            poi["comments"]=@tmp_com
            point["event"]=poi
            @events.push(point)
          end
        end
        obj["events"]=@events
        #
        #services
        #
        @services=Array.new

        @servi=iti.itinerary_services
        if @servi.length > 0
          @servi.each do |ser|
            point=Hash.new
            point["order"]=ser.order
            poi=Hash.new
            if params[:lang]!=nil
              t_id=Language.where("abv=?",params[:lang]).first
            else
              t_id=1
            end
            tra=ServiceTranslation.where("language_id=?",t_id).where("service_id=?",ser.service_id).first
            serv=Service.where("id=?",ser.service_id).first
            poi["id"]=ser.service_id
            poi["poi_type"]=2
            poi["name"]=tra.name
            poi["description"]=tra.description
            poi["schedule"]=tra.schedule
            poi["transport"]=tra.transport
            poi["site"]=serv.site
            poi["email"]=serv.email
            poi["address"]=serv.address
            poi["phone"]=serv.phone
            poi["latitude"]=serv.latitude
            poi["longitude"]=serv.longitude
            poi["isActive"]=serv.active
            poi["timestamp"]=serv.timestamp
            poi["hasAccessibily"]=serv.accessibility
            poi["rating"]=serv.rating
            @tmp=Array.new
            serv.types.each do |t|
              @tmp.push(t.name)
            end
            poi["type"]=@tmp
            @tmp_photo=Array.new
            serv.photo_services.all.each do |p|
              @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
            end
            poi["photos"]=@tmp_photo
            @tmp_com=Array.new
            serv.comment_services.all.each do |c|
              com=Hash.new
              com["comment"]=c.comment
              com["date"]=c.evaluationdate
              use=MobileUser.where("id=?",c.mobile_user_id).first
              com["username"]=use.firstname+" "+use.surname
              @tmp_com.push(com)
            end
            poi["comments"]=@tmp_com
            point["service"]=poi
            @services.push(point)
          end
        end
        obj["services"]=@services
        @result.push(obj)
      end
      respond_to do |format|
        format.json{ render :json => @result }
      end
    end
    if params[:co]!=nil && params[:attr]
      @com=CommentAttraction.new
      @rat=RatingAttraction.new
      @com.comment=params[:comentario]
      @rat.rating=params[:rating]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      @rat.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Attraction.where("id=?",params[:id]).first
      @com.attraction=obj
      @rat.attraction=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @rat.mobile_user=@use.mobile_user

      @rat.valid?
      @com.valid?

      if @com.errors.blank?
        @rat.save()
        @com.save()
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>"true") }
        end
      else
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>"false") }
        end
      end
    end
    if params[:co]!=nil && params[:even]
      @com=CommentEvent.new
      @rat=RatingEvent.new
      @com.comment=params[:comentario]
      @rat.rating=params[:rating]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      @rat.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Event.where("id=?",params[:id]).first
      @com.event=obj
      @rat.event=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @rat.mobile_user=@use.mobile_user

      @rat.valid?
      @com.valid?

      if @com.errors.blank?
        @rat.save()
        @com.save()
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>true) }
        end
      else
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>false) }
        end
      end
    end
    if params[:co]!=nil && params[:serv]
      @com=CommentService.new
      @rat=RatingService.new
      @com.comment=params[:comentario]
      @rat.rating=params[:rating]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      @rat.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Service.where("id=?",params[:id]).first
      @com.service=obj
      @rat.service=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @rat.mobile_user=@use.mobile_user

      @rat.valid?
      @com.valid?

      if @com.errors.blank?
        @rat.save()
        @com.save()
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>"true") }
        end
      else
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>"false") }
        end
      end
    end
    if params[:co]!=nil && params[:itin]
      @com=CommentItinerary.new
      @rat=RatingItinerary.new
      @com.comment=params[:comentario]
      @rat.rating=params[:rating]
      @com.evaluationdate=Time.now.strftime("%Y-%m-%d")
      obj=Itinerary.where("id=?",params[:id]).first
      @com.itinerary=obj
      @rat.itinerary=obj
      @use=User.where("username=?",params[:user]).first
      @com.mobile_user=@use.mobile_user
      @rat.mobile_user=@use.mobile_user

      @rat.valid?
      @com.valid?

      if @com.errors.blank?
        @rat.save()
        @com.save()
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>"true") }
        end
      else
        respond_to do |format|
          format.json {  render :json => Hash.new("success"=>"false") }
        end
      end
    end
    #
    #Anuncios
    #
    if params[:anun]!=nil
      if params[:lang]!=nil
        t_id=Language.where("abv=?",params[:lang]).first
      else
        t_id=1
      end
      @result=Array.new
      WebUser.where("web_user_type_id=?",2).all.each do |use|
        Event.where("web_user_id=?",use.id).all.each do |anun|
          event=Hash.new
          event["id"]=anun.id

          trans=EventTranslation.where("language_id=?",t_id).where("event_id=?",anun.id).first
          if trans != nil
            event["name"]=trans.name
            event["description"]=trans.description
            event["schedule"]=trans.schedule
            event["transport"]=trans.transport
            event["price"]=trans.price
            event["program"]=trans.program
          end

          if anun.site!=nil
            event["site"]=anun.site
          else
            event["site"]=""
          end
          if anun.email!=nil
            event["email"]=anun.email
          else
            event["email"]=""
          end
          if anun.address!=nil
            event["address"]=anun.address
          else
            event["address"]=""
          end
          if anun.phone!=nil
            event["phone"]=anun.phone
          else
            event["phone"]=""
          end
          event["latitude"]=anun.latitude
          event["longitude"]=anun.longitude
          event["source"]=anun.source
          event["organization"]=anun.organization
          event["timestamp"]=anun.timestamp
          event["isActive"]=anun.active
          event["hasAccessibility"]=anun.accessibility
          @tmp=Array.new
          anun.types.each do |t|
            @tmp.push(t.name)
          end
          event["type"]=@tmp
          @tmp_photo=Array.new
          anun.photo_events.all.each do |p|
            @tmp_photo.push("http://193.136.19.202:80"+p.photo.url(:small,false))
          end
          event["photos"]=@tmp_photo
          event["rating"]=anun.rating
          #event["isReferencePoint"]=eve.reference_point
          @tmp_com=Array.new
          anun.comment_events.all.each do |c|
            com=Hash.new
            com["comment"]=c.comment
            com["date"]=c.evaluationdate
            use=User.where("id=?",c.mobile_user_id).first
            com["username"]=use.username
            @tmp_com.push(com)
          end
          event["comments"]=@tmp_com
          @result.push(event)
        end
      end
      respond_to do |format|
        format.json {  render :json => @result }
      end
    end
    if params[:registar]!= nil
      @user=User.new
      @user.email=params[:email]
      @user.username=params[:username]
      @user.password=params[:email]
      @user.password_confirmation=params[:email]
      @user.language_id = 1
      @user.country_id = 188
      @mobile_user = MobileUser.new
      @mobile_user.firstname=params[:firstname]
      @mobile_user.surname=params[:surname]
      @mobile_user.gender=nil
      @mobile_user.active=true
      @mobile_user.dateofbirth=nil

      @user.valid?
      @mobile_user.valid?

      if @user.errors.blank?
        @user.save
        @mobile_user.id = @user.id
        @mobile_user.save
        hash=Hash.new
        hash["id"]=@user.id
        respond_to do |format|
          format.json {  render :json => hash }
        end
      else
        hash=Hash.new
        hash["erro"]="Erro ao gravar"
        respond_to do |format|
          format.json {  render :json => hash }
        end
      end
    end
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
        format.html { redirect_to @api, notice: 'Api criada com sucesso.' }
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
        format.html { redirect_to @api, notice: 'Api actualizada com sucesso.' }
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
  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def api_params
    params[:api]
  end
end
