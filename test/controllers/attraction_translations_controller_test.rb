require 'test_helper'

class AttractionTranslationsControllerTest < ActionController::TestCase
  setup do
    @attraction_translation = attraction_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attraction_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction_translation" do
    assert_difference('AttractionTranslation.count') do
      post :create, attraction_translation: { description: @attraction_translation.description, language: @attraction_translation.language, name: @attraction_translation.name, schedule: @attraction_translation.schedule, transport: @attraction_translation.transport }
    end

    assert_redirected_to attraction_translation_path(assigns(:attraction_translation))
  end

  test "should show attraction_translation" do
    get :show, id: @attraction_translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction_translation
    assert_response :success
  end

  test "should update attraction_translation" do
    patch :update, id: @attraction_translation, attraction_translation: { description: @attraction_translation.description, language: @attraction_translation.language, name: @attraction_translation.name, schedule: @attraction_translation.schedule, transport: @attraction_translation.transport }
    assert_redirected_to attraction_translation_path(assigns(:attraction_translation))
  end

  test "should destroy attraction_translation" do
    assert_difference('AttractionTranslation.count', -1) do
      delete :destroy, id: @attraction_translation
    end

    assert_redirected_to attraction_translations_path
  end
end
