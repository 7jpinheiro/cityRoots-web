require 'test_helper'

class LocalsControllerTest < ActionController::TestCase
  setup do
    @local = locals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local" do
    assert_difference('Local.count') do
      post :create, local: { active: @local.active, address: @local.address, city_id: @local.city_id, coord: @local.coord, description: @local.description, email: @local.email, name: @local.name, reference_point: @local.reference_point, schedule: @local.schedule, site: @local.site, timestamp: @local.timestamp, transport: @local.transport, user_web_id: @local.user_web_id }
    end

    assert_redirected_to local_path(assigns(:local))
  end

  test "should show local" do
    get :show, id: @local
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local
    assert_response :success
  end

  test "should update local" do
    patch :update, id: @local, local: { active: @local.active, address: @local.address, city_id: @local.city_id, coord: @local.coord, description: @local.description, email: @local.email, name: @local.name, reference_point: @local.reference_point, schedule: @local.schedule, site: @local.site, timestamp: @local.timestamp, transport: @local.transport, user_web_id: @local.user_web_id }
    assert_redirected_to local_path(assigns(:local))
  end

  test "should destroy local" do
    assert_difference('Local.count', -1) do
      delete :destroy, id: @local
    end

    assert_redirected_to locals_path
  end
end
