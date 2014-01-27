require 'test_helper'

class RatingItinerariesControllerTest < ActionController::TestCase
  setup do
    @rating_itinerary = rating_itineraries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_itineraries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_itinerary" do
    assert_difference('RatingItinerary.count') do
      post :create, rating_itinerary: { evaluationdate: @rating_itinerary.evaluationdate, itinerary_id: @rating_itinerary.itinerary_id, mobile_user_id: @rating_itinerary.mobile_user_id, rating: @rating_itinerary.rating }
    end

    assert_redirected_to rating_itinerary_path(assigns(:rating_itinerary))
  end

  test "should show rating_itinerary" do
    get :show, id: @rating_itinerary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_itinerary
    assert_response :success
  end

  test "should update rating_itinerary" do
    patch :update, id: @rating_itinerary, rating_itinerary: { evaluationdate: @rating_itinerary.evaluationdate, itinerary_id: @rating_itinerary.itinerary_id, mobile_user_id: @rating_itinerary.mobile_user_id, rating: @rating_itinerary.rating }
    assert_redirected_to rating_itinerary_path(assigns(:rating_itinerary))
  end

  test "should destroy rating_itinerary" do
    assert_difference('RatingItinerary.count', -1) do
      delete :destroy, id: @rating_itinerary
    end

    assert_redirected_to itinerary_rating_itineraries_path
  end
end
