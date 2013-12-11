require 'test_helper'

class CommentAttractionsControllerTest < ActionController::TestCase
  setup do
    @comment_attraction = comment_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_attraction" do
    assert_difference('CommentAttraction.count') do
      post :create, comment_attraction: { attraction_id: @comment_attraction.attraction_id, comment: @comment_attraction.comment, evalutiondate: @comment_attraction.evalutiondate, mobile_user_id: @comment_attraction.mobile_user_id }
    end

    assert_redirected_to comment_attraction_path(assigns(:comment_attraction))
  end

  test "should show comment_attraction" do
    get :show, id: @comment_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_attraction
    assert_response :success
  end

  test "should update comment_attraction" do
    patch :update, id: @comment_attraction, comment_attraction: { attraction_id: @comment_attraction.attraction_id, comment: @comment_attraction.comment, evalutiondate: @comment_attraction.evalutiondate, mobile_user_id: @comment_attraction.mobile_user_id }
    assert_redirected_to comment_attraction_path(assigns(:comment_attraction))
  end

  test "should destroy comment_attraction" do
    assert_difference('CommentAttraction.count', -1) do
      delete :destroy, id: @comment_attraction
    end

    assert_redirected_to comment_attractions_path
  end
end
