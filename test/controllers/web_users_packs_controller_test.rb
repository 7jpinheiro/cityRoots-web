require 'test_helper'

class WebUsersPacksControllerTest < ActionController::TestCase
  setup do
    @web_users_pack = web_users_packs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_users_packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_users_pack" do
    assert_difference('WebUsersPack.count') do
      post :create, web_users_pack: { active: @web_users_pack.active, obs: @web_users_pack.obs, pack_type_id: @web_users_pack.pack_type_id, subscriptiondate: @web_users_pack.subscriptiondate, user_web_id: @web_users_pack.user_web_id, validity: @web_users_pack.validity }
    end

    assert_redirected_to web_users_pack_path(assigns(:web_users_pack))
  end

  test "should show web_users_pack" do
    get :show, id: @web_users_pack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_users_pack
    assert_response :success
  end

  test "should update web_users_pack" do
    patch :update, id: @web_users_pack, web_users_pack: { active: @web_users_pack.active, obs: @web_users_pack.obs, pack_type_id: @web_users_pack.pack_type_id, subscriptiondate: @web_users_pack.subscriptiondate, user_web_id: @web_users_pack.user_web_id, validity: @web_users_pack.validity }
    assert_redirected_to web_users_pack_path(assigns(:web_users_pack))
  end

  test "should destroy web_users_pack" do
    assert_difference('WebUsersPack.count', -1) do
      delete :destroy, id: @web_users_pack
    end

    assert_redirected_to web_users_packs_path
  end
end
