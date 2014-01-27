require 'test_helper'

class MobileUserCitiesControllerTest < ActionController::TestCase
  setup do
    @mobile_user_city = mobile_user_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobile_user_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobile_user_city" do
    assert_difference('MobileUserCity.count') do
      post :create, mobile_user_city: { city_id: @mobile_user_city.city_id, mobile_user_id: @mobile_user_city.mobile_user_id }
    end

    assert_redirected_to mobile_user_city_path(assigns(:mobile_user_city))
  end

  test "should show mobile_user_city" do
    get :show, id: @mobile_user_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mobile_user_city
    assert_response :success
  end

  test "should update mobile_user_city" do
    patch :update, id: @mobile_user_city, mobile_user_city: { city_id: @mobile_user_city.city_id, mobile_user_id: @mobile_user_city.mobile_user_id }
    assert_redirected_to mobile_user_city_path(assigns(:mobile_user_city))
  end

  test "should destroy mobile_user_city" do
    assert_difference('MobileUserCity.count', -1) do
      delete :destroy, id: @mobile_user_city
    end

    assert_redirected_to mobile_user_mobile_user_cities_path
  end
end
