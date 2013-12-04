class CommentsLocalsController < ApplicationController
  before_action :set_comments_local, only: [:show, :edit, :update, :destroy]

  # GET /comments_locals
  # GET /comments_locals.json
  def index
    @comments_locals = CommentsLocal.all
  end

  # GET /comments_locals/1
  # GET /comments_locals/1.json
  def show
  end

  # GET /comments_locals/new
  def new
    @comments_local = CommentsLocal.new
  end

  # GET /comments_locals/1/edit
  def edit
  end

  # POST /comments_locals
  # POST /comments_locals.json
  def create
    @comments_local = CommentsLocal.new(comments_local_params)

    respond_to do |format|
      if @comments_local.save
        format.html { redirect_to @comments_local, notice: 'Comments local was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comments_local }
      else
        format.html { render action: 'new' }
        format.json { render json: @comments_local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_locals/1
  # PATCH/PUT /comments_locals/1.json
  def update
    respond_to do |format|
      if @comments_local.update(comments_local_params)
        format.html { redirect_to @comments_local, notice: 'Comments local was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comments_local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_locals/1
  # DELETE /comments_locals/1.json
  def destroy
    @comments_local.destroy
    respond_to do |format|
      format.html { redirect_to comments_locals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_local
      @comments_local = CommentsLocal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comments_local_params
      params.require(:comments_local).permit(:comment, :evalutiondate, :user_mobile_id, :local_id)
    end
end
