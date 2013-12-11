require 'test_helper'

class CommentsServicesControllerTest < ActionController::TestCase
  setup do
    @comments_service = comments_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_service" do
    assert_difference('CommentsService.count') do
      post :create, comments_service: { comment: @comments_service.comment, evalutiondate: @comments_service.evalutiondate, mobile_user_id: @comments_service.mobile_user_id, service_id: @comments_service.service_id }
    end

    assert_redirected_to comments_service_path(assigns(:comments_service))
  end

  test "should show comments_service" do
    get :show, id: @comments_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_service
    assert_response :success
  end

  test "should update comments_service" do
    patch :update, id: @comments_service, comments_service: { comment: @comments_service.comment, evalutiondate: @comments_service.evalutiondate, mobile_user_id: @comments_service.mobile_user_id, service_id: @comments_service.service_id }
    assert_redirected_to comments_service_path(assigns(:comments_service))
  end

  test "should destroy comments_service" do
    assert_difference('CommentsService.count', -1) do
      delete :destroy, id: @comments_service
    end

    assert_redirected_to comments_services_path
  end
end
