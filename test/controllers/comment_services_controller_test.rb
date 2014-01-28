require 'test_helper'

class CommentServicesControllerTest < ActionController::TestCase
  setup do
    @comment_service = comment_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_service" do
    assert_difference('CommentService.count') do
      post :create, comment_service: { comment: @comment_service.comment, evalutiondate: @comment_service.evalutiondate, mobile_user_id: @comment_service.mobile_user_id, service_id: @comment_service.service_id }
    end

    assert_redirected_to service_comment_service_path(assigns(:comment_service))
  end

  test "should show comment_service" do
    get :show, id: @comment_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_service
    assert_response :success
  end

  test "should update comment_service" do
    patch :update, id: @comment_service, comment_service: { comment: @comment_service.comment, evalutiondate: @comment_service.evalutiondate, mobile_user_id: @comment_service.mobile_user_id, service_id: @comment_service.service_id }
    assert_redirected_to service_comment_service_path(assigns(:comment_service))
  end

  test "should destroy comment_service" do
    assert_difference('CommentService.count', -1) do
      delete :destroy, id: @comment_service
    end

    assert_redirected_to service_comment_services_path
  end
end
