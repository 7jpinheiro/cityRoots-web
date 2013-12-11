class AttractionTypesController < ApplicationController
  before_action :set_attraction_type, only: [:show, :edit, :update, :destroy]

  # GET /attraction_types
  # GET /attraction_types.json
  def index
    @attraction_types = AttractionType.all
  end

  # GET /attraction_types/1
  # GET /attraction_types/1.json
  def show
  end

  # GET /attraction_types/new
  def new
    @attraction_type = AttractionType.new
  end

  # GET /attraction_types/1/edit
  def edit
  end

  # POST /attraction_types
  # POST /attraction_types.json
  def create
    @attraction_type = AttractionType.new(attraction_type_params)

    respond_to do |format|
      if @attraction_type.save
        format.html { redirect_to @attraction_type, notice: 'Attraction type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attraction_types/1
  # PATCH/PUT /attraction_types/1.json
  def update
    respond_to do |format|
      if @attraction_type.update(attraction_type_params)
        format.html { redirect_to @attraction_type, notice: 'Attraction type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attraction_types/1
  # DELETE /attraction_types/1.json
  def destroy
    @attraction_type.destroy
    respond_to do |format|
      format.html { redirect_to attraction_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_type
      @attraction_type = AttractionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_type_params
      params.require(:attraction_type).permit(:name, :description, :attraction_big_types_id)
    end
end
