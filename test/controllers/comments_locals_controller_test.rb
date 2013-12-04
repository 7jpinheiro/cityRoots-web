require 'test_helper'

class CommentsLocalsControllerTest < ActionController::TestCase
  setup do
    @comments_local = comments_locals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_locals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_local" do
    assert_difference('CommentsLocal.count') do
      post :create, comments_local: { comment: @comments_local.comment, evalutiondate: @comments_local.evalutiondate, local_id: @comments_local.local_id, user_mobile_id: @comments_local.user_mobile_id }
    end

    assert_redirected_to comments_local_path(assigns(:comments_local))
  end

  test "should show comments_local" do
    get :show, id: @comments_local
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_local
    assert_response :success
  end

  test "should update comments_local" do
    patch :update, id: @comments_local, comments_local: { comment: @comments_local.comment, evalutiondate: @comments_local.evalutiondate, local_id: @comments_local.local_id, user_mobile_id: @comments_local.user_mobile_id }
    assert_redirected_to comments_local_path(assigns(:comments_local))
  end

  test "should destroy comments_local" do
    assert_difference('CommentsLocal.count', -1) do
      delete :destroy, id: @comments_local
    end

    assert_redirected_to comments_locals_path
  end
end
