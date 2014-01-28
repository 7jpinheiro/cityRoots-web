require 'test_helper'

class PhotoServicesControllerTest < ActionController::TestCase
  setup do
    @photo_service = photo_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_service" do
    assert_difference('PhotoService.count') do
      post :create, photo_service: { description: @photo_service.description, extension: @photo_service.extension, name: @photo_service.name, url: @photo_service.url }
    end

    assert_redirected_to service_photo_service_path(assigns(:photo_service))
  end

  test "should show photo_service" do
    get :show, id: @photo_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_service
    assert_response :success
  end

  test "should update photo_service" do
    patch :update, id: @photo_service, photo_service: { description: @photo_service.description, extension: @photo_service.extension, name: @photo_service.name, url: @photo_service.url }
    assert_redirected_to service_photo_service_path(assigns(:photo_service))
  end

  test "should destroy photo_service" do
    assert_difference('PhotoService.count', -1) do
      delete :destroy, id: @photo_service
    end

    assert_redirected_to service_photo_services_path
  end
end
