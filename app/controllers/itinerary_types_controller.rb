class ItineraryTypesController < ApplicationController
  before_action :set_itinerary_type, only: [:show, :edit, :update, :destroy]

  # GET /itinerary_types
  # GET /itinerary_types.json
  def index
    @itinerary_types = ItineraryType.all
  end

  # GET /itinerary_types/1
  # GET /itinerary_types/1.json
  def show
  end

  # GET /itinerary_types/new
  def new
    @itinerary_type = ItineraryType.new
  end

  # GET /itinerary_types/1/edit
  def edit
  end

  # POST /itinerary_types
  # POST /itinerary_types.json
  def create
    @itinerary_type = ItineraryType.new(itinerary_type_params)

    respond_to do |format|
      if @itinerary_type.save
        format.html { redirect_to @itinerary_type, notice: 'Itinerary type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerary_types/1
  # PATCH/PUT /itinerary_types/1.json
  def update
    respond_to do |format|
      if @itinerary_type.update(itinerary_type_params)
        format.html { redirect_to @itinerary_type, notice: 'Itinerary type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerary_types/1
  # DELETE /itinerary_types/1.json
  def destroy
    @itinerary_type.destroy
    respond_to do |format|
      format.html { redirect_to itinerary_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_type
      @itinerary_type = ItineraryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_type_params
      params.require(:itinerary_type).permit(:id,:name, :description)
    end
end
