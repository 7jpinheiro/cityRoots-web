require 'test_helper'

class EventTranslationsControllerTest < ActionController::TestCase
  setup do
    @event_translation = event_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_translation" do
    assert_difference('EventTranslation.count') do
      post :create, event_translation: { description: @event_translation.description, language: @event_translation.language, name: @event_translation.name, schedule: @event_translation.schedule, transport: @event_translation.transport }
    end

    assert_redirected_to event_translation_path(assigns(:event_translation))
  end

  test "should show event_translation" do
    get :show, id: @event_translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_translation
    assert_response :success
  end

  test "should update event_translation" do
    patch :update, id: @event_translation, event_translation: { description: @event_translation.description, language: @event_translation.language, name: @event_translation.name, schedule: @event_translation.schedule, transport: @event_translation.transport }
    assert_redirected_to event_translation_path(assigns(:event_translation))
  end

  test "should destroy event_translation" do
    assert_difference('EventTranslation.count', -1) do
      delete :destroy, id: @event_translation
    end

    assert_redirected_to event_translations_path
  end
end
