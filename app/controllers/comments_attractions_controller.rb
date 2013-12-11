class CommentsAttractionsController < ApplicationController
  before_action :set_comments_attraction, only: [:show, :edit, :update, :destroy]

  # GET /comments_attractions
  # GET /comments_attractions.json
  def index
    @comments_attractions = CommentsAttraction.all
  end

  # GET /comments_attractions/1
  # GET /comments_attractions/1.json
  def show
  end

  # GET /comments_attractions/new
  def new
    @comments_attraction = CommentsAttraction.new
  end

  # GET /comments_attractions/1/edit
  def edit
  end

  # POST /comments_attractions
  # POST /comments_attractions.json
  def create
    @comments_attraction = CommentsAttraction.new(comments_attraction_params)

    respond_to do |format|
      if @comments_attraction.save
        format.html { redirect_to @comments_attraction, notice: 'Comments attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comments_attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @comments_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_attractions/1
  # PATCH/PUT /comments_attractions/1.json
  def update
    respond_to do |format|
      if @comments_attraction.update(comments_attraction_params)
        format.html { redirect_to @comments_attraction, notice: 'Comments attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comments_attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_attractions/1
  # DELETE /comments_attractions/1.json
  def destroy
    @comments_attraction.destroy
    respond_to do |format|
      format.html { redirect_to comments_attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_attraction
      @comments_attraction = CommentsAttraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_attraction_params
      params.require(:comments_attraction).permit(:comment, :evalutiondate, :mobile_user_id, :attraction_id)
    end
end
