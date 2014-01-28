class ServicesController < ApplicationController
  
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource 


  # GET /services
  # GET /services.json
  def index
     if (!current_user.nil?) && (current_user.role? (:admin))

       @services = Service.all.page(params[:page]).per(10)

    else
      unless(params[:search].nil?)
        @services = Service.search(params[:search],current_user).page(params[:page]).per(10)
      else
        @services = current_user.web_user.services.page(params[:page]).per(10) if  current_user  && current_user.web_user
      end
      respond_to do |format|
        format.html{@services.page(params[:page]).per(10)}
        format.json{render :json => Service.page(params[:page]).per(25).as_json({:include=>{:service_translations=>{:include=>:language},:city=>{:include=>:country},:photo_services=>{},:types=>{},:comment_services=>{:include=>:mobile_user}}})}
      end
    end
  end

   #post
  def excel
    uploaded_io = params[:services][:file]
    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    id= current_user.id
    puts path.inspect + "---------------%%%%%%%%%%"
    @result = system("perl #{Rails.root}/lib/genServices  #{path} -u #{id}")
    
    puts @result.inspect + "---------------%%%%%%%%%%"
    params=nil
    if !@result
           flash[:error] = "Ocorreu um erro ao processar o seu ficheiro, verifique se o ficheiro contem a formatação correta."
    else
           flash[:notice] = "Serviços inseridos com sucesso!"

    end
    redirect_to(services_path)
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service=Service.find(params[:id])
    respond_to do |format|
      format.html { render :layout => 'layout_welc' }
      format.json { render :json => @service.as_json({:include=>{:service_translations=>{:include=>:language},:city=>{:include=>:country},:photo_services=>{},:types=>{},:comment_services=>{:include=>:mobile_user}}})}
    end
  end

  # GET /services/new
  def new
    @service = Service.new
    1.times{@service.photo_services.build}
    1.times{@service.service_translations.build}
    1.times{@service.service_types.build}
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    #@num_serv = current_user.web_user.services.
    #if(current_user.role? :comercial_basic )
     # if(num_serv<1)

      #else
       # errors
        
    #if(current_user.role? :comercial_basic )
     # if(num_serv<5)

      #else
       # errors

    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Serviço criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @service }
      else
        format.html { render action: 'new' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
     # end
    #end
    #end
  end

  def autocomplete_service_name
    services = ServiceTranslation.select([:name]).where("name LIKE ?", "%#{params[:name]}%")
    result = services.collect do |t|
      { value: t.name }
    end
    render json: result
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Serviço actualizado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(
          :site,
          :email,
          :address,
          :latitude,
          :longitude,
          :reference_point,
          :active,
          :timestamp,
          :capacity,
          :details,
          :rating,
          :accessibility,
          :city_id,
          :web_user_id,
          service_types_attributes:[
              :id,
              :service_id,
              :type_id,
              :_destroy
          ],
          service_translations_attributes:[
              :id,
              :name,
              :schedule,
              :language_id,
              :description,
              :transport,
              :service_id,
              :_destroy
          ]
      )
    end

end
