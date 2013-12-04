class AttractionBigTypesController < ApplicationController
  before_action :set_attraction_big_type, only: [:show, :edit, :update, :destroy]

  # GET /attraction_big_types
  # GET /attraction_big_types.json
  def index
    @attraction_big_types = AttractionBigType.all
  end

  # GET /attraction_big_types/1
  # GET /attraction_big_types/1.json
  def show
  end

  # GET /attraction_big_types/new
  def new
    @attraction_big_type = AttractionBigType.new
  end

  # GET /attraction_big_types/1/edit
  def edit
  end

  # POST /attraction_big_types
  # POST /attraction_big_types.json
  def create
    @attraction_big_type = AttractionBigType.new(attraction_big_type_params)

    respond_to do |format|
      if @attraction_big_type.save
        format.html { redirect_to @attraction_big_type, notice: 'Attraction big type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction_big_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction_big_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attraction_big_types/1
  # PATCH/PUT /attraction_big_types/1.json
  def update
    respond_to do |format|
      if @attraction_big_type.update(attraction_big_type_params)
        format.html { redirect_to @attraction_big_type, notice: 'Attraction big type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction_big_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attraction_big_types/1
  # DELETE /attraction_big_types/1.json
  def destroy
    @attraction_big_type.destroy
    respond_to do |format|
      format.html { redirect_to attraction_big_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_big_type
      @attraction_big_type = AttractionBigType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_big_type_params
      params.require(:attraction_big_type).permit(:name, :description)
    end
end
