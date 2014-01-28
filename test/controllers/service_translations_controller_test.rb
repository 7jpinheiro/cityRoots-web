require 'test_helper'

class ServiceTranslationsControllerTest < ActionController::TestCase
  setup do
    @service_translation = service_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_translation" do
    assert_difference('ServiceTranslation.count') do
      post :create, service_translation: { description: @service_translation.description, language: @service_translation.language, name: @service_translation.name, schedule: @service_translation.schedule, transport: @service_translation.transport }
    end

    assert_redirected_to service_translation_path(assigns(:service_translation))
  end

  test "should show service_translation" do
    get :show, id: @service_translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_translation
    assert_response :success
  end

  test "should update service_translation" do
    patch :update, id: @service_translation, service_translation: { description: @service_translation.description, language: @service_translation.language, name: @service_translation.name, schedule: @service_translation.schedule, transport: @service_translation.transport }
    assert_redirected_to service_translation_path(assigns(:service_translation))
  end

  test "should destroy service_translation" do
    assert_difference('ServiceTranslation.count', -1) do
      delete :destroy, id: @service_translation
    end

    assert_redirected_to service_translations_path
  end
end
