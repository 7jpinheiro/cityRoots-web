require 'test_helper'

class CommentsItinerariesControllerTest < ActionController::TestCase
  setup do
    @comments_itinerary = comments_itineraries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_itineraries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_itinerary" do
    assert_difference('CommentsItinerary.count') do
      post :create, comments_itinerary: { comment: @comments_itinerary.comment, evalutiondate: @comments_itinerary.evalutiondate, itinerary_id: @comments_itinerary.itinerary_id, mobile_user_id: @comments_itinerary.mobile_user_id }
    end

    assert_redirected_to comments_itinerary_path(assigns(:comments_itinerary))
  end

  test "should show comments_itinerary" do
    get :show, id: @comments_itinerary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_itinerary
    assert_response :success
  end

  test "should update comments_itinerary" do
    patch :update, id: @comments_itinerary, comments_itinerary: { comment: @comments_itinerary.comment, evalutiondate: @comments_itinerary.evalutiondate, itinerary_id: @comments_itinerary.itinerary_id, mobile_user_id: @comments_itinerary.mobile_user_id }
    assert_redirected_to comments_itinerary_path(assigns(:comments_itinerary))
  end

  test "should destroy comments_itinerary" do
    assert_difference('CommentsItinerary.count', -1) do
      delete :destroy, id: @comments_itinerary
    end

    assert_redirected_to comments_itineraries_path
  end
end
