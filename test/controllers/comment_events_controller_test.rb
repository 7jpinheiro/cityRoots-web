require 'test_helper'

class CommentEventsControllerTest < ActionController::TestCase
  setup do
    @comment_event = comment_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_event" do
    assert_difference('CommentEvent.count') do
      post :create, comment_event: { comment: @comment_event.comment, evalutiondate: @comment_event.evalutiondate, event_id: @comment_event.event_id, mobile_user_id: @comment_event.mobile_user_id }
    end

    assert_redirected_to event_comment_event_path(assigns(:comment_event))
  end

  test "should show comment_event" do
    get :show, id: @comment_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_event
    assert_response :success
  end

  test "should update comment_event" do
    patch :update, id: @comment_event, comment_event: { comment: @comment_event.comment, evalutiondate: @comment_event.evalutiondate, event_id: @comment_event.event_id, mobile_user_id: @comment_event.mobile_user_id }
    assert_redirected_to event_comment_event_path(assigns(:comment_event))
  end

  test "should destroy comment_event" do
    assert_difference('CommentEvent.count', -1) do
      delete :destroy, id: @comment_event
    end

    assert_redirected_to comment_events_path
  end
end
