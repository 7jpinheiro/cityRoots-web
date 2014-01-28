require 'test_helper'

class ItineraryAttractionsControllerTest < ActionController::TestCase
  setup do
    @itinerary_attraction = itinerary_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerary_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerary_attraction" do
    assert_difference('ItineraryAttraction.count') do
      post :create, itinerary_attraction: { attraction_id: @itinerary_attraction.attraction_id, itinerary_id: @itinerary_attraction.itinerary_id }
    end

    assert_redirected_to itinerary_itinerary_attraction_path(assigns(:itinerary_attraction))
  end

  test "should show itinerary_attraction" do
    get :show, id: @itinerary_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itinerary_attraction
    assert_response :success
  end

  test "should update itinerary_attraction" do
    patch :update, id: @itinerary_attraction, itinerary_attraction: { attraction_id: @itinerary_attraction.attraction_id, itinerary_id: @itinerary_attraction.itinerary_id }
    assert_redirected_to itinerary_itinerary_attraction_path(assigns(:itinerary_attraction))
  end

  test "should destroy itinerary_attraction" do
    assert_difference('ItineraryAttraction.count', -1) do
      delete :destroy, id: @itinerary_attraction
    end

    assert_redirected_to itinerary_itinerary_attractions_path
  end
end
