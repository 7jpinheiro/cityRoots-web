require 'test_helper'

class ItineraryEventsControllerTest < ActionController::TestCase
  setup do
    @itinerary_event = itinerary_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerary_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerary_event" do
    assert_difference('ItineraryEvent.count') do
      post :create, itinerary_event: { event_id: @itinerary_event.event_id, itinerary_id: @itinerary_event.itinerary_id }
    end

    assert_redirected_to itinerary_event_path(assigns(:itinerary_event))
  end

  test "should show itinerary_event" do
    get :show, id: @itinerary_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itinerary_event
    assert_response :success
  end

  test "should update itinerary_event" do
    patch :update, id: @itinerary_event, itinerary_event: { event_id: @itinerary_event.event_id, itinerary_id: @itinerary_event.itinerary_id }
    assert_redirected_to itinerary_event_path(assigns(:itinerary_event))
  end

  test "should destroy itinerary_event" do
    assert_difference('ItineraryEvent.count', -1) do
      delete :destroy, id: @itinerary_event
    end

    assert_redirected_to itinerary_events_path
  end
end
