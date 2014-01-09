class PhotoAttractionsController < ApplicationController
  before_action :set_photo_attraction, only: [:show, :edit, :update, :destroy]

  # GET /photo_attractions
  # GET /photo_attractions.json
  def index
    @photo_attractions = PhotoAttraction.all
  end

  # GET /photo_attractions/1
  # GET /photo_attractions/1.json
  def show
  end

  # GET /photo_attractions/new
  def new
    @photo_attraction = PhotoAttraction.new
  end

  # GET /photo_attractions/1/edit
  def edit
  end

  # POST /photo_attractions
  # POST /photo_attractions.json
  def create
    puts "------------------ create" + photo_attraction_params.inspect + "------------------"
    @photo_attraction = PhotoAttraction.new(photo_attraction_params)
    puts "------------------ hhjhjhj" + @photo_attraction.inspect + "------------------"

      if @photo_attraction.save
        puts "------------------ create successfully"
        flash.now[:alert] = 'Save photo attraction!'
      else
        puts "------------------ create error"
        flash.now[:alert] = 'Error while saving photo attraction!'
      end
  end

  # PATCH/PUT /photo_attractions/1
  # PATCH/PUT /photo_attractions/1.json
  def update
    respond_to do |format|
      if @photo_attraction.update(photo_attraction_params)
        format.html { redirect_to @photo_attraction, notice: 'Photo attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_attractions/1
  # DELETE /photo_attractions/1.json
  def destroy
    @photo_attraction.destroy
    respond_to do |format|
      format.html { redirect_to photo_attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_attraction
      @photo_attraction = PhotoAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_attraction_params
      params.require(:photo_attraction).permit(:description, :attraction_id, :photo)
    end
end
