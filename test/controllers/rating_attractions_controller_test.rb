require 'test_helper'

class RatingAttractionsControllerTest < ActionController::TestCase
  setup do
    @rating_attraction = rating_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_attraction" do
    assert_difference('RatingAttraction.count') do
      post :create, rating_attraction: { attraction_id: @rating_attraction.attraction_id, evaluationdate: @rating_attraction.evaluationdate, mobile_user_id: @rating_attraction.mobile_user_id, rating: @rating_attraction.rating }
    end

    assert_redirected_to attraction_rating_attraction_path(assigns(:rating_attraction))
  end

  test "should show rating_attraction" do
    get :show, id: @rating_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_attraction
    assert_response :success
  end

  test "should update rating_attraction" do
    patch :update, id: @rating_attraction, rating_attraction: { attraction_id: @rating_attraction.attraction_id, evaluationdate: @rating_attraction.evaluationdate, mobile_user_id: @rating_attraction.mobile_user_id, rating: @rating_attraction.rating }
    assert_redirected_to attraction_rating_attraction_path(assigns(:rating_attraction))
  end

  test "should destroy rating_attraction" do
    assert_difference('RatingAttraction.count', -1) do
      delete :destroy, id: @rating_attraction
    end

    assert_redirected_to attraction_rating_attractions_path
  end
end
