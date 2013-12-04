require 'test_helper'

class LocalServicesControllerTest < ActionController::TestCase
  setup do
    @local_service = local_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_service" do
    assert_difference('LocalService.count') do
      post :create, local_service: { capacity: @local_service.capacity, details: @local_service.details, service_type_id: @local_service.service_type_id }
    end

    assert_redirected_to local_service_path(assigns(:local_service))
  end

  test "should show local_service" do
    get :show, id: @local_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_service
    assert_response :success
  end

  test "should update local_service" do
    patch :update, id: @local_service, local_service: { capacity: @local_service.capacity, details: @local_service.details, service_type_id: @local_service.service_type_id }
    assert_redirected_to local_service_path(assigns(:local_service))
  end

  test "should destroy local_service" do
    assert_difference('LocalService.count', -1) do
      delete :destroy, id: @local_service
    end

    assert_redirected_to local_services_path
  end
end
