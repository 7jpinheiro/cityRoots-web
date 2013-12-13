class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]
  add_crumb("Home") { |instance| instance.send :root_url }
  add_crumb "Rotas", :events_url

  # GET /itineraries
  # GET /itineraries.json
  def index
    @itineraries = Itinerary.all
  end

  # GET /itineraries/1
  # GET /itineraries/1.json
  def show
    add_crumb @itinerary.name, ""
  end

  # GET /itineraries/new
  def new
    add_crumb "Novo", ""
    @itinerary = Itinerary.new
  end

  # GET /itineraries/1/edit
  def edit
    add_crumb @itinerary.name, itinerary_url
    add_crumb "Editar", ""
  end

  # POST /itineraries
  # POST /itineraries.json
  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @itinerary }
      else
        format.html { render action: 'new' }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itineraries/1
  # PATCH/PUT /itineraries/1.json
  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.json
  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_params
      params.require(:itinerary).permit(:name, :description, :itinerary_type_id)
    end
end