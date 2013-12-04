class LocalAttractionsController < ApplicationController
  before_action :set_local_attraction, only: [:show, :edit, :update, :destroy]

  # GET /local_attractions
  # GET /local_attractions.json
  def index
    @local_attractions = LocalAttraction.all
  end

  # GET /local_attractions/1
  # GET /local_attractions/1.json
  def show
  end

  # GET /local_attractions/new
  def new
    @local_attraction = LocalAttraction.new
  end

  # GET /local_attractions/1/edit
  def edit
  end

  # POST /local_attractions
  # POST /local_attractions.json
  def create
    @local_attraction = LocalAttraction.new(local_attraction_params)

    respond_to do |format|
      if @local_attraction.save
        format.html { redirect_to @local_attraction, notice: 'Local attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @local_attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @local_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_attractions/1
  # PATCH/PUT /local_attractions/1.json
  def update
    respond_to do |format|
      if @local_attraction.update(local_attraction_params)
        format.html { redirect_to @local_attraction, notice: 'Local attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_attractions/1
  # DELETE /local_attractions/1.json
  def destroy
    @local_attraction.destroy
    respond_to do |format|
      format.html { redirect_to local_attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_attraction
      @local_attraction = LocalAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_attraction_params
      params.require(:local_attraction).permit(:details, :price, :attraction_type)
    end
end
