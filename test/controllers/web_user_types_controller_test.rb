require 'test_helper'

class WebUserTypesControllerTest < ActionController::TestCase
  setup do
    @web_user_type = web_user_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_user_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_user_type" do
    assert_difference('WebUserType.count') do
      post :create, web_user_type: { description: @web_user_type.description, name: @web_user_type.name }
    end

    assert_redirected_to web_user_web_user_type_path(assigns(:web_user_type))
  end

  test "should show web_user_type" do
    get :show, id: @web_user_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_user_type
    assert_response :success
  end

  test "should update web_user_type" do
    patch :update, id: @web_user_type, web_user_type: { description: @web_user_type.description, name: @web_user_type.name }
    assert_redirected_to web_user_web_user_type_path(assigns(:web_user_type))
  end

  test "should destroy web_user_type" do
    assert_difference('WebUserType.count', -1) do
      delete :destroy, id: @web_user_type
    end

    assert_redirected_to web_user_types_path
  end
end
