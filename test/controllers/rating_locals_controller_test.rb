require 'test_helper'

class RatingLocalsControllerTest < ActionController::TestCase
  setup do
    @rating_local = rating_locals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_locals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_local" do
    assert_difference('RatingLocal.count') do
      post :create, rating_local: { evaluationdate: @rating_local.evaluationdate, local_id: @rating_local.local_id, rating: @rating_local.rating, user_mobile_id: @rating_local.user_mobile_id }
    end

    assert_redirected_to rating_local_path(assigns(:rating_local))
  end

  test "should show rating_local" do
    get :show, id: @rating_local
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_local
    assert_response :success
  end

  test "should update rating_local" do
    patch :update, id: @rating_local, rating_local: { evaluationdate: @rating_local.evaluationdate, local_id: @rating_local.local_id, rating: @rating_local.rating, user_mobile_id: @rating_local.user_mobile_id }
    assert_redirected_to rating_local_path(assigns(:rating_local))
  end

  test "should destroy rating_local" do
    assert_difference('RatingLocal.count', -1) do
      delete :destroy, id: @rating_local
    end

    assert_redirected_to rating_locals_path
  end
end
