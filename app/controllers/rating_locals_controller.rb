class RatingLocalsController < ApplicationController
  before_action :set_rating_local, only: [:show, :edit, :update, :destroy]

  # GET /rating_locals
  # GET /rating_locals.json
  def index
    @rating_locals = RatingLocal.all
  end

  # GET /rating_locals/1
  # GET /rating_locals/1.json
  def show
  end

  # GET /rating_locals/new
  def new
    @rating_local = RatingLocal.new
  end

  # GET /rating_locals/1/edit
  def edit
  end

  # POST /rating_locals
  # POST /rating_locals.json
  def create
    @rating_local = RatingLocal.new(rating_local_params)

    respond_to do |format|
      if @rating_local.save
        format.html { redirect_to @rating_local, notice: 'Rating local was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rating_local }
      else
        format.html { render action: 'new' }
        format.json { render json: @rating_local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_locals/1
  # PATCH/PUT /rating_locals/1.json
  def update
    respond_to do |format|
      if @rating_local.update(rating_local_params)
        format.html { redirect_to @rating_local, notice: 'Rating local was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating_local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_locals/1
  # DELETE /rating_locals/1.json
  def destroy
    @rating_local.destroy
    respond_to do |format|
      format.html { redirect_to rating_locals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_local
      @rating_local = RatingLocal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_local_params
      params.require(:rating_local).permit(:rating, :evaluationdate, :user_mobile_id, :local_id)
    end
end
