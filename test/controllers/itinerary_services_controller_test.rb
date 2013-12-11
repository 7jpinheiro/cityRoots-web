require 'test_helper'

class ItineraryServicesControllerTest < ActionController::TestCase
  setup do
    @itinerary_service = itinerary_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerary_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerary_service" do
    assert_difference('ItineraryService.count') do
      post :create, itinerary_service: { itinerary_id: @itinerary_service.itinerary_id, service_id: @itinerary_service.service_id }
    end

    assert_redirected_to itinerary_service_path(assigns(:itinerary_service))
  end

  test "should show itinerary_service" do
    get :show, id: @itinerary_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itinerary_service
    assert_response :success
  end

  test "should update itinerary_service" do
    patch :update, id: @itinerary_service, itinerary_service: { itinerary_id: @itinerary_service.itinerary_id, service_id: @itinerary_service.service_id }
    assert_redirected_to itinerary_service_path(assigns(:itinerary_service))
  end

  test "should destroy itinerary_service" do
    assert_difference('ItineraryService.count', -1) do
      delete :destroy, id: @itinerary_service
    end

    assert_redirected_to itinerary_services_path
  end
end
