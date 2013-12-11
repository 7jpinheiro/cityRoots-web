require 'test_helper'

class CommentsEventsControllerTest < ActionController::TestCase
  setup do
    @comments_event = comments_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_event" do
    assert_difference('CommentsEvent.count') do
      post :create, comments_event: { comment: @comments_event.comment, evalutiondate: @comments_event.evalutiondate, event_id: @comments_event.event_id, mobile_user_id: @comments_event.mobile_user_id }
    end

    assert_redirected_to comments_event_path(assigns(:comments_event))
  end

  test "should show comments_event" do
    get :show, id: @comments_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_event
    assert_response :success
  end

  test "should update comments_event" do
    patch :update, id: @comments_event, comments_event: { comment: @comments_event.comment, evalutiondate: @comments_event.evalutiondate, event_id: @comments_event.event_id, mobile_user_id: @comments_event.mobile_user_id }
    assert_redirected_to comments_event_path(assigns(:comments_event))
  end

  test "should destroy comments_event" do
    assert_difference('CommentsEvent.count', -1) do
      delete :destroy, id: @comments_event
    end

    assert_redirected_to comments_events_path
  end
end
