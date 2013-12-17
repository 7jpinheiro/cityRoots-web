require 'test_helper'

class PhotoEventsControllerTest < ActionController::TestCase
  setup do
    @photo_event = photo_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_event" do
    assert_difference('PhotoEvent.count') do
      post :create, photo_event: { description: @photo_event.description, extension: @photo_event.extension, name: @photo_event.name, url: @photo_event.url }
    end

    assert_redirected_to photo_event_path(assigns(:photo_event))
  end

  test "should show photo_event" do
    get :show, id: @photo_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_event
    assert_response :success
  end

  test "should update photo_event" do
    patch :update, id: @photo_event, photo_event: { description: @photo_event.description, extension: @photo_event.extension, name: @photo_event.name, url: @photo_event.url }
    assert_redirected_to photo_event_path(assigns(:photo_event))
  end

  test "should destroy photo_event" do
    assert_difference('PhotoEvent.count', -1) do
      delete :destroy, id: @photo_event
    end

    assert_redirected_to photo_events_path
  end
end
