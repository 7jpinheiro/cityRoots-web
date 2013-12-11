require 'test_helper'

class MobileUsersControllerTest < ActionController::TestCase
  setup do
    @mobile_user = mobile_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobile_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobile_user" do
    assert_difference('MobileUser.count') do
      post :create, mobile_user: { active: @mobile_user.active, country_id: @mobile_user.country_id, country_id: @mobile_user.country_id, dateofbirth: @mobile_user.dateofbirth, email: @mobile_user.email, firstname: @mobile_user.firstname, gender: @mobile_user.gender, language_id: @mobile_user.language_id, pass: @mobile_user.pass, surname: @mobile_user.surname, username: @mobile_user.username }
    end

    assert_redirected_to mobile_user_path(assigns(:mobile_user))
  end

  test "should show mobile_user" do
    get :show, id: @mobile_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mobile_user
    assert_response :success
  end

  test "should update mobile_user" do
    patch :update, id: @mobile_user, mobile_user: { active: @mobile_user.active, country_id: @mobile_user.country_id, country_id: @mobile_user.country_id, dateofbirth: @mobile_user.dateofbirth, email: @mobile_user.email, firstname: @mobile_user.firstname, gender: @mobile_user.gender, language_id: @mobile_user.language_id, pass: @mobile_user.pass, surname: @mobile_user.surname, username: @mobile_user.username }
    assert_redirected_to mobile_user_path(assigns(:mobile_user))
  end

  test "should destroy mobile_user" do
    assert_difference('MobileUser.count', -1) do
      delete :destroy, id: @mobile_user
    end

    assert_redirected_to mobile_users_path
  end
end
