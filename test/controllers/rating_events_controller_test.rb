require 'test_helper'

class RatingEventsControllerTest < ActionController::TestCase
  setup do
    @rating_event = rating_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_event" do
    assert_difference('RatingEvent.count') do
      post :create, rating_event: { evaluationdate: @rating_event.evaluationdate, event_id: @rating_event.event_id, mobile_user_id: @rating_event.mobile_user_id, rating: @rating_event.rating }
    end

    assert_redirected_to event_rating_event_path(assigns(:rating_event))
  end

  test "should show rating_event" do
    get :show, id: @rating_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_event
    assert_response :success
  end

  test "should update rating_event" do
    patch :update, id: @rating_event, rating_event: { evaluationdate: @rating_event.evaluationdate, event_id: @rating_event.event_id, mobile_user_id: @rating_event.mobile_user_id, rating: @rating_event.rating }
    assert_redirected_to event_rating_event_path(assigns(:rating_event))
  end

  test "should destroy rating_event" do
    assert_difference('RatingEvent.count', -1) do
      delete :destroy, id: @rating_event
    end

    assert_redirected_to event_rating_events_path
  end
end
