require 'test_helper'

class RatingServicesControllerTest < ActionController::TestCase
  setup do
    @rating_service = rating_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_service" do
    assert_difference('RatingService.count') do
      post :create, rating_service: { evaluationdate: @rating_service.evaluationdate, mobile_user_id: @rating_service.mobile_user_id, rating: @rating_service.rating, service_id: @rating_service.service_id }
    end

    assert_redirected_to rating_service_path(assigns(:rating_service))
  end

  test "should show rating_service" do
    get :show, id: @rating_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_service
    assert_response :success
  end

  test "should update rating_service" do
    patch :update, id: @rating_service, rating_service: { evaluationdate: @rating_service.evaluationdate, mobile_user_id: @rating_service.mobile_user_id, rating: @rating_service.rating, service_id: @rating_service.service_id }
    assert_redirected_to rating_service_path(assigns(:rating_service))
  end

  test "should destroy rating_service" do
    assert_difference('RatingService.count', -1) do
      delete :destroy, id: @rating_service
    end

    assert_redirected_to rating_services_path
  end
end
