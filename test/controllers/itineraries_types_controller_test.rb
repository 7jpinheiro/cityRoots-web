require 'test_helper'

class ItinerariesTypesControllerTest < ActionController::TestCase
  setup do
    @itineraries_type = itineraries_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itineraries_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itineraries_type" do
    assert_difference('ItinerariesType.count') do
      post :create, itineraries_type: { description: @itineraries_type.description, name: @itineraries_type.name }
    end

    assert_redirected_to itineraries_type_path(assigns(:itineraries_type))
  end

  test "should show itineraries_type" do
    get :show, id: @itineraries_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itineraries_type
    assert_response :success
  end

  test "should update itineraries_type" do
    patch :update, id: @itineraries_type, itineraries_type: { description: @itineraries_type.description, name: @itineraries_type.name }
    assert_redirected_to itineraries_type_path(assigns(:itineraries_type))
  end

  test "should destroy itineraries_type" do
    assert_difference('ItinerariesType.count', -1) do
      delete :destroy, id: @itineraries_type
    end

    assert_redirected_to itineraries_types_path
  end
end
