class MobileUserCitiesController < ApplicationController
  before_action :set_mobile_user_city, only: [:show, :edit, :update, :destroy]

  # GET /mobile_user_cities
  # GET /mobile_user_cities.json
  def index
    @mobile_user_cities = MobileUserCity.all
  end

  # GET /mobile_user_cities/1
  # GET /mobile_user_cities/1.json
  def show
  end

  # GET /mobile_user_cities/new
  def new
    @mobile_user_city = MobileUserCity.new
  end

  # GET /mobile_user_cities/1/edit
  def edit
  end

  # POST /mobile_user_cities
  # POST /mobile_user_cities.json
  def create
    @mobile_user_city = MobileUserCity.new(mobile_user_city_params)

    respond_to do |format|
      if @mobile_user_city.save
        format.html { redirect_to @mobile_user_city, notice: 'Mobile user city was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mobile_user_city }
      else
        format.html { render action: 'new' }
        format.json { render json: @mobile_user_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mobile_user_cities/1
  # PATCH/PUT /mobile_user_cities/1.json
  def update
    respond_to do |format|
      if @mobile_user_city.update(mobile_user_city_params)
        format.html { redirect_to @mobile_user_city, notice: 'Mobile user city was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mobile_user_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mobile_user_cities/1
  # DELETE /mobile_user_cities/1.json
  def destroy
    @mobile_user_city.destroy
    respond_to do |format|
      format.html { redirect_to mobile_user_cities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobile_user_city
      @mobile_user_city = MobileUserCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mobile_user_city_params
      params.require(:mobile_user_city).permit(:city_id, :mobile_user_id)
    end
end
