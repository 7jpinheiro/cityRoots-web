class RatingServicesController < ApplicationController
  before_action :set_rating_service, only: [:show, :edit, :update, :destroy]

  # GET /rating_services
  # GET /rating_services.json
  def index
    @rating_services = RatingService.all
  end

  # GET /rating_services/1
  # GET /rating_services/1.json
  def show
  end

  # GET /rating_services/new
  def new
    @rating_service = RatingService.new
  end

  # GET /rating_services/1/edit
  def edit
  end

  # POST /rating_services
  # POST /rating_services.json
  def create
    @rating_service = RatingService.new(rating_service_params)

    respond_to do |format|
      if @rating_service.save
        format.html { redirect_to @rating_service, notice: 'Serviço de classificação criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @rating_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_services/1
  # PATCH/PUT /rating_services/1.json
  def update
    respond_to do |format|
      if @rating_service.update(rating_service_params)
        format.html { redirect_to @rating_service, notice: 'Serviço de classificação actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_services/1
  # DELETE /rating_services/1.json
  def destroy
    @rating_service.destroy
    respond_to do |format|
      format.html { redirect_to rating_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_service
      @rating_service = RatingService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_service_params
      params.require(:rating_service).permit(:rating, :evaluationdate, :mobile_user_id, :service_id)
    end
end
