class RatingAttractionsController < ApplicationController
  before_action :set_rating_attraction, only: [:show, :edit, :update, :destroy]

  # GET /rating_attractions
  # GET /rating_attractions.json
  def index
    @rating_attractions = RatingAttraction.all
  end

  # GET /rating_attractions/1
  # GET /rating_attractions/1.json
  def show
  end

  # GET /rating_attractions/new
  def new
    @rating_attraction = RatingAttraction.new
  end

  # GET /rating_attractions/1/edit
  def edit
  end

  # POST /rating_attractions
  # POST /rating_attractions.json
  def create
    @rating_attraction = RatingAttraction.new(rating_attraction_params)

    respond_to do |format|
      if @rating_attraction.save
        format.html { redirect_to @rating_attraction, notice: 'Serviço de classificação para atrações criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @rating_attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_attractions/1
  # PATCH/PUT /rating_attractions/1.json
  def update
    respond_to do |format|
      if @rating_attraction.update(rating_attraction_params)
        format.html { redirect_to @rating_attraction, notice: 'Serviço de classificação para atrações actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_attractions/1
  # DELETE /rating_attractions/1.json
  def destroy
    @rating_attraction.destroy
    respond_to do |format|
      format.html { redirect_to rating_attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_attraction
      @rating_attraction = RatingAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_attraction_params
      params.require(:rating_attraction).permit(:rating, :evaluationdate, :mobile_user_id, :attraction_id)
    end
end
