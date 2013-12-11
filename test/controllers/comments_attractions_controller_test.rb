require 'test_helper'

class CommentsAttractionsControllerTest < ActionController::TestCase
  setup do
    @comments_attraction = comments_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_attraction" do
    assert_difference('CommentsAttraction.count') do
      post :create, comments_attraction: { attraction_id: @comments_attraction.attraction_id, comment: @comments_attraction.comment, evalutiondate: @comments_attraction.evalutiondate, mobile_user_id: @comments_attraction.mobile_user_id }
    end

    assert_redirected_to comments_attraction_path(assigns(:comments_attraction))
  end

  test "should show comments_attraction" do
    get :show, id: @comments_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_attraction
    assert_response :success
  end

  test "should update comments_attraction" do
    patch :update, id: @comments_attraction, comments_attraction: { attraction_id: @comments_attraction.attraction_id, comment: @comments_attraction.comment, evalutiondate: @comments_attraction.evalutiondate, mobile_user_id: @comments_attraction.mobile_user_id }
    assert_redirected_to comments_attraction_path(assigns(:comments_attraction))
  end

  test "should destroy comments_attraction" do
    assert_difference('CommentsAttraction.count', -1) do
      delete :destroy, id: @comments_attraction
    end

    assert_redirected_to comments_attractions_path
  end
end
