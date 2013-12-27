class ServiceTranslationsController < ApplicationController
  before_action :set_service_translation, only: [:show, :edit, :update, :destroy]

  # GET /service_translations
  # GET /service_translations.json
  def index
    @service_translations = ServiceTranslation.all
  end

  # GET /service_translations/1
  # GET /service_translations/1.json
  def show
  end

  # GET /service_translations/new
  def new
    @service_translation = ServiceTranslation.new
  end

  # GET /service_translations/1/edit
  def edit
  end

  # POST /service_translations
  # POST /service_translations.json
  def create
    @service_translation = ServiceTranslation.new(service_translation_params)

    respond_to do |format|
      if @service_translation.save
        format.html { redirect_to @service_translation, notice: 'Service translation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @service_translation }
      else
        format.html { render action: 'new' }
        format.json { render json: @service_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_translations/1
  # PATCH/PUT /service_translations/1.json
  def update
    respond_to do |format|
      if @service_translation.update(service_translation_params)
        format.html { redirect_to @service_translation, notice: 'Service translation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @service_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_translations/1
  # DELETE /service_translations/1.json
  def destroy
    @service_translation.destroy
    respond_to do |format|
      format.html { redirect_to service_translations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_translation
      @service_translation = ServiceTranslation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_translation_params
      params.require(:service_translation).permit(:id,:name, :schedule, :language, :description, :transport)
    end
end
