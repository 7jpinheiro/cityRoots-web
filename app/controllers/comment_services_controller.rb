class CommentServicesController < ApplicationController
  before_action :set_comment_service, only: [:show, :edit, :update, :destroy]

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

  # GET /comment_services
  # GET /comment_services.json
  def index
    @comment_services = CommentService.all
  end

  # GET /comment_services/1
  # GET /comment_services/1.json
  def show
  end

  # GET /comment_services/new
  def new
    @comment_service = CommentService.new
  end

  # GET /comment_services/1/edit
  def edit
  end

  # POST /comment_services
  # POST /comment_services.json
  def create
    @comment_service = CommentService.new(comment_service_params)

    respond_to do |format|
      if @comment_service.save
        format.html { redirect_to @comment_service, notice: 'Serviço de comentários criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @comment_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_services/1
  # PATCH/PUT /comment_services/1.json
  def update
    respond_to do |format|
      if @comment_service.update(comment_service_params)
        format.html { redirect_to @comment_service, notice: 'Serviço de comentários actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_services/1
  # DELETE /comment_services/1.json
  def destroy
    @comment_service.destroy
    respond_to do |format|
      format.html { redirect_to comment_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_service
      @comment_service = CommentService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_service_params
      params.require(:comment_service).permit(:comment, :evaluationdate, :mobile_user_id, :service_id)
    end
end
