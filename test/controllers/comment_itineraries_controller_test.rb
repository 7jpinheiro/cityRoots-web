require 'test_helper'

class CommentItinerariesControllerTest < ActionController::TestCase
  setup do
    @comment_itinerary = comment_itineraries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_itineraries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_itinerary" do
    assert_difference('CommentItinerary.count') do
      post :create, comment_itinerary: { comment: @comment_itinerary.comment, evalutiondate: @comment_itinerary.evalutiondate, itinerary_id: @comment_itinerary.itinerary_id, mobile_user_id: @comment_itinerary.mobile_user_id }
    end

    assert_redirected_to itinerary_comment_itinerary_path(assigns(:comment_itinerary))
  end

  test "should show comment_itinerary" do
    get :show, id: @comment_itinerary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_itinerary
    assert_response :success
  end

  test "should update comment_itinerary" do
    patch :update, id: @comment_itinerary, comment_itinerary: { comment: @comment_itinerary.comment, evalutiondate: @comment_itinerary.evalutiondate, itinerary_id: @comment_itinerary.itinerary_id, mobile_user_id: @comment_itinerary.mobile_user_id }
    assert_redirected_to itinerary_comment_itinerary_path(assigns(:comment_itinerary))
  end

  test "should destroy comment_itinerary" do
    assert_difference('CommentItinerary.count', -1) do
      delete :destroy, id: @comment_itinerary
    end

    assert_redirected_to itinerary_comment_itineraries_path
  end
end
