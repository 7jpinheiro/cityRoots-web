class AttractionsController < ApplicationController
  #before_filter :user_is_current_user
  skip_before_filter :verify_authenticity_token  
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET /attractions
  # GET /attractions.json
  def index
    @attractions=Attraction.all
    respond_to do |format|
      format.html{}
      format.json{render :json => @attractions.as_json( :include => [:attraction_translations, :comment_attractions,:photo_attractions,:city,:types]) }
    end
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
    @attraction=Attraction.find(params[:id])
    respond_to do |format|
      format.html { @attraction }
      format.json{render :json => @attraction.as_json( :include => [:attraction_translations, :comment_attractions,:photo_attractions,:city,:types]) }
    end
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
    1.times{@attraction.attraction_translations.build}
    1.times{@attraction.attraction_types.build}
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)
    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
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

    def user_is_current_user
      unless current_user.id == params[:user_id]
      flash[:notice] = "You may only view your own products."
      redirect_to root_path
    end
  end

end
