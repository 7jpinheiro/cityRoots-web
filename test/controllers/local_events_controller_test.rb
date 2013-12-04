require 'test_helper'

class LocalEventsControllerTest < ActionController::TestCase
  setup do
    @local_event = local_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_event" do
    assert_difference('LocalEvent.count') do
      post :create, local_event: { enddate: @local_event.enddate, event_type_id: @local_event.event_type_id, organization: @local_event.organization, price: @local_event.price, program: @local_event.program, stardate: @local_event.stardate }
    end

    assert_redirected_to local_event_path(assigns(:local_event))
  end

  test "should show local_event" do
    get :show, id: @local_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_event
    assert_response :success
  end

  test "should update local_event" do
    patch :update, id: @local_event, local_event: { enddate: @local_event.enddate, event_type_id: @local_event.event_type_id, organization: @local_event.organization, price: @local_event.price, program: @local_event.program, stardate: @local_event.stardate }
    assert_redirected_to local_event_path(assigns(:local_event))
  end

  test "should destroy local_event" do
    assert_difference('LocalEvent.count', -1) do
      delete :destroy, id: @local_event
    end

    assert_redirected_to local_events_path
  end
end
