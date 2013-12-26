class EventTranslationsController < ApplicationController
  before_action :set_event_translation, only: [:show, :edit, :update, :destroy]

  # GET /event_translations
  # GET /event_translations.json
  def index
    @event_translations = EventTranslation.all
  end

  # GET /event_translations/1
  # GET /event_translations/1.json
  def show
  end

  # GET /event_translations/new
  def new
    @event_translation = EventTranslation.new
  end

  # GET /event_translations/1/edit
  def edit
  end

  # POST /event_translations
  # POST /event_translations.json
  def create
    @event_translation = EventTranslation.new(event_translation_params)

    respond_to do |format|
      if @event_translation.save
        format.html { redirect_to @event_translation, notice: 'Event translation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event_translation }
      else
        format.html { render action: 'new' }
        format.json { render json: @event_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_translations/1
  # PATCH/PUT /event_translations/1.json
  def update
    respond_to do |format|
      if @event_translation.update(event_translation_params)
        format.html { redirect_to @event_translation, notice: 'Event translation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_translations/1
  # DELETE /event_translations/1.json
  def destroy
    @event_translation.destroy
    respond_to do |format|
      format.html { redirect_to event_translations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_translation
      @event_translation = EventTranslation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_translation_params
      params.require(:event_translation).permit(:id,:name, :schedule, :language, :description, :transport)
    end
end
