class CommentsServicesController < ApplicationController
  before_action :set_comments_service, only: [:show, :edit, :update, :destroy]

  # GET /comments_services
  # GET /comments_services.json
  def index
    @comments_services = CommentsService.all
  end

  # GET /comments_services/1
  # GET /comments_services/1.json
  def show
  end

  # GET /comments_services/new
  def new
    @comments_service = CommentsService.new
  end

  # GET /comments_services/1/edit
  def edit
  end

  # POST /comments_services
  # POST /comments_services.json
  def create
    @comments_service = CommentsService.new(comments_service_params)

    respond_to do |format|
      if @comments_service.save
        format.html { redirect_to @comments_service, notice: 'Comments service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comments_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @comments_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_services/1
  # PATCH/PUT /comments_services/1.json
  def update
    respond_to do |format|
      if @comments_service.update(comments_service_params)
        format.html { redirect_to @comments_service, notice: 'Comments service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comments_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_services/1
  # DELETE /comments_services/1.json
  def destroy
    @comments_service.destroy
    respond_to do |format|
      format.html { redirect_to comments_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_service
      @comments_service = CommentsService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_service_params
      params.require(:comments_service).permit(:comment, :evalutiondate, :mobile_user_id, :service_id)
    end
end
