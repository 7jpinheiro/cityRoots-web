require 'test_helper'

class WebUserPacksControllerTest < ActionController::TestCase
  setup do
    @web_user_pack = web_user_packs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_user_packs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_user_pack" do
    assert_difference('WebUserPack.count') do
      post :create, web_user_pack: { active: @web_user_pack.active, obs: @web_user_pack.obs, pack_type_id: @web_user_pack.pack_type_id, subscriptiondate: @web_user_pack.subscriptiondate, validity: @web_user_pack.validity, web_user_id: @web_user_pack.web_user_id }
    end

    assert_redirected_to web_user_web_user_pack_path(assigns(:web_user_pack))
  end

  test "should show web_user_pack" do
    get :show, id: @web_user_pack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_user_pack
    assert_response :success
  end

  test "should update web_user_pack" do
    patch :update, id: @web_user_pack, web_user_pack: { active: @web_user_pack.active, obs: @web_user_pack.obs, pack_type_id: @web_user_pack.pack_type_id, subscriptiondate: @web_user_pack.subscriptiondate, validity: @web_user_pack.validity, web_user_id: @web_user_pack.web_user_id }
    assert_redirected_to web_user_web_user_pack_path(assigns(:web_user_pack))
  end

  test "should destroy web_user_pack" do
    assert_difference('WebUserPack.count', -1) do
      delete :destroy, id: @web_user_pack
    end

    assert_redirected_to web_user_packs_path
  end
end
