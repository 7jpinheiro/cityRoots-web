class AttractionTranslationsController < ApplicationController
  before_action :set_attraction_translation, only: [:show, :edit, :update, :destroy]

  # GET /attraction_translations
  # GET /attraction_translations.json
  def index
    @attraction_translations = AttractionTranslation.all
  end

  # GET /attraction_translations/1
  # GET /attraction_translations/1.json
  def show
  end

  # GET /attraction_translations/new
  def new
    @attraction_translation = AttractionTranslation.new
  end

  # GET /attraction_translations/1/edit
  def edit
  end

  # POST /attraction_translations
  # POST /attraction_translations.json
  def create
    @attraction_translation = AttractionTranslation.new(attraction_translation_params)

    respond_to do |format|
      if @attraction_translation.save
        format.html { redirect_to @attraction_translation, notice: 'Attraction translation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction_translation }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attraction_translations/1
  # PATCH/PUT /attraction_translations/1.json
  def update
    respond_to do |format|
      if @attraction_translation.update(attraction_translation_params)
        format.html { redirect_to @attraction_translation, notice: 'Attraction translation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attraction_translations/1
  # DELETE /attraction_translations/1.json
  def destroy
    @attraction_translation.destroy
    respond_to do |format|
      format.html { redirect_to attraction_translations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_translation
      @attraction_translation = AttractionTranslation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_translation_params
      params.require(:attraction_translation).permit(
          :id,
          :name,
          :schedule,
          :price,
          :language_id,
          :description,
          :transport,
          :attraction_id
      )
    end
end
