class PackTypesController < ApplicationController
  before_action :set_pack_type, only: [:show, :edit, :update, :destroy]

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  load_and_authorize_resource

  
  # GET /pack_types
  # GET /pack_types.json
  def index
    @pack_types = PackType.all
  end

  # GET /pack_types/1
  # GET /pack_types/1.json
  def show
  end

  # GET /pack_types/new
  def new
    @pack_type = PackType.new
  end

  # GET /pack_types/1/edit
  def edit
  end

  # POST /pack_types
  # POST /pack_types.json
  def create
    @pack_type = PackType.new(pack_type_params)

    respond_to do |format|
      if @pack_type.save
        format.html { redirect_to @pack_type, notice: 'Pack type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pack_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @pack_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pack_types/1
  # PATCH/PUT /pack_types/1.json
  def update
    respond_to do |format|
      if @pack_type.update(pack_type_params)
        format.html { redirect_to @pack_type, notice: 'Pack type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pack_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pack_types/1
  # DELETE /pack_types/1.json
  def destroy
    @pack_type.destroy
    respond_to do |format|
      format.html { redirect_to pack_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pack_type
      @pack_type = PackType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pack_type_params
      params.require(:pack_type).permit(:name, :description, :duration, :price)
    end
end
