class CommentAttractionsController < ApplicationController
  before_action :set_comment_attraction, only: [:show, :edit, :update, :destroy]

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource


  # GET /comment_attractions
  # GET /comment_attractions.json
  def index
    @comment_attractions = CommentAttraction.all
  end

  # GET /comment_attractions/1
  # GET /comment_attractions/1.json
  def show
  end

  # GET /comment_attractions/new
  def new
    @comment_attraction = CommentAttraction.new
  end

  # GET /comment_attractions/1/edit
  def edit
  end

  # POST /comment_attractions
  # POST /comment_attractions.json
  def create
    @comment_attraction = CommentAttraction.new(comment_attraction_params)

    respond_to do |format|
      if @comment_attraction.save
        format.html { redirect_to @comment_attraction, notice: 'Comentário de ponto de interesse criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @comment_attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_attractions/1
  # PATCH/PUT /comment_attractions/1.json
  def update
    respond_to do |format|
      if @comment_attraction.update(comment_attraction_params)
        format.html { redirect_to @comment_attraction, notice: 'Comentário de ponto de interesse actualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_attractions/1
  # DELETE /comment_attractions/1.json
  def destroy
    @comment_attraction.destroy
    respond_to do |format|
      format.html { redirect_to comment_attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_attraction
      @comment_attraction = CommentAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_attraction_params
      params.require(:comment_attraction).permit(:comment, :evaluationdate, :mobile_user_id, :attraction_id)
    end
end
