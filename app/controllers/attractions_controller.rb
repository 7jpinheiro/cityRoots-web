class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource


  # GET /attractions
  # GET /attractions.json
  def index
    if (!current_user.nil?) && (current_user.role? (:admin))
      @attractions = Attraction.page(params[:page]).per(10)
    else
      unless(params[:search].nil?)
        @attractions = Attraction.search(params[:search],current_user).page(params[:page]).per(10)
      else
        @attractions = current_user.web_user.attractions.page(params[:page]).per(10) if  current_user  && current_user.web_user
      end
    end
    respond_to do |format|
      format.html{}
      format.json{render :json =>Attraction.page(params[:page]).per(25).as_json({:include=>{:attraction_translations=>{:include=>{:language=>{}}},:city=>{:include=>:country},:photo_attractions=>{},:types=>{}}}) }
    end
  end

  #post
  def excel
    uploaded_io = params[:attractions][:file]
    path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    id= current_user.id
    puts path.inspect + "---------------%%%%%%%%%%"
    @result = system("perl #{Rails.root}/lib/genAttractions  #{path} -u #{id}")
    
    puts @result.inspect + "---------------%%%%%%%%%%"
    params=nil
    if !@result
           flash[:error] = "Ocorreu um erro ao processar o seu ficheiro, verifique se o ficheiro contem a formatação correta."
    else
           flash[:notice] = "Pontos de Interesse inseridos com sucesso!"

    end
    redirect_to(attractions_path)
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
    @attraction=Attraction.find(params[:id])
    @attraction_translation = @attraction.attraction_translations.first
    respond_to do |format|
      format.html { render :layout => 'layout_welc'}
      format.json{render :json => @attraction.to_json({:include=>{:attraction_translations=>{:include=>:language},:city=>{:include=>:country},:photo_attractions=>{},:types=>{},:comment_attractions=>{:include=>:mobile_user}}})}
    end
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
    @attraction_translation = @attraction.attraction_translations.build
    @attraction.attraction_types.build
  end

  # GET /attractions/1/edit
  def edit
    @attraction=Attraction.find(params[:id])
    @attraction_translation = @attraction.attraction_translations.first
    gon.attractions_translations =@attraction.attraction_translations
  end

  # POST /attractions
  # POST /attractions.json
  def create
    puts "create %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55"
    @attraction = Attraction.new(attraction_params)
    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Ponto de Interesse criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @attraction }
      else
        format.html { render action: 'new', notice: 'Erro ao criar Ponto de Interesse.'  }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Ponto de Interesse actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url }
      format.json { head :no_content }
    end
  end

  def autocomplete_attraction_name
    attractions = AttractionTranslation.select([:name]).where("name LIKE ?", "%#{params[:name]}%")
    result = attractions.collect do |t|
      { value: t.name }
    end
    render json: result
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attraction_params
    params.require(:attraction).permit(
        :site,
        :email,
        :address,
        :phone,
        :latitude,
        :longitude,
        :source,
        :reference_point,
        :active,
        :timestamp,
        :accessibility,
        :city_id,
        :web_user_id,
        attraction_translations_attributes: [
            :id,
            :name,
            :schedule,
            :price,
            :language_id,
            :description,
            :transport,
            :attraction_id
        ],
        attraction_types_attributes: [:id,:attraction_id,:type_id,:_destroy],
        photo_attractions_attributes: :photo
    )
  end

end
