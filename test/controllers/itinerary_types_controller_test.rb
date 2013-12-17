require 'test_helper'

class ItineraryTypesControllerTest < ActionController::TestCase
  setup do
    @itinerary_type = itinerary_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerary_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerary_type" do
    assert_difference('ItineraryType.count') do
      post :create, itinerary_type: { description: @itinerary_type.description, name: @itinerary_type.name }
    end

    assert_redirected_to itinerary_type_path(assigns(:itinerary_type))
  end

  test "should show itinerary_type" do
    get :show, id: @itinerary_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itinerary_type
    assert_response :success
  end

  test "should update itinerary_type" do
    patch :update, id: @itinerary_type, itinerary_type: { description: @itinerary_type.description, name: @itinerary_type.name }
    assert_redirected_to itinerary_type_path(assigns(:itinerary_type))
  end

  test "should destroy itinerary_type" do
    assert_difference('ItineraryType.count', -1) do
      delete :destroy, id: @itinerary_type
    end

    assert_redirected_to itinerary_types_path
  end
end
