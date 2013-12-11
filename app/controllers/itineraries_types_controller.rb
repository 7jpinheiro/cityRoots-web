class ItinerariesTypesController < ApplicationController
  before_action :set_itineraries_type, only: [:show, :edit, :update, :destroy]

  # GET /itineraries_types
  # GET /itineraries_types.json
  def index
    @itineraries_types = ItinerariesType.all
  end

  # GET /itineraries_types/1
  # GET /itineraries_types/1.json
  def show
  end

  # GET /itineraries_types/new
  def new
    @itineraries_type = ItinerariesType.new
  end

  # GET /itineraries_types/1/edit
  def edit
  end

  # POST /itineraries_types
  # POST /itineraries_types.json
  def create
    @itineraries_type = ItinerariesType.new(itineraries_type_params)

    respond_to do |format|
      if @itineraries_type.save
        format.html { redirect_to @itineraries_type, notice: 'Itineraries type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itineraries_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @itineraries_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries_types/1
  # PATCH/PUT /itineraries_types/1.json
  def update
    respond_to do |format|
      if @itineraries_type.update(itineraries_type_params)
        format.html { redirect_to @itineraries_type, notice: 'Itineraries type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itineraries_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries_types/1
  # DELETE /itineraries_types/1.json
  def destroy
    @itineraries_type.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itineraries_type
      @itineraries_type = ItinerariesType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itineraries_type_params
      params.require(:itineraries_type).permit(:name, :description)
    end
end
