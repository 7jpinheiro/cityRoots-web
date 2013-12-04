require 'test_helper'

class LocalAttractionsControllerTest < ActionController::TestCase
  setup do
    @local_attraction = local_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_attraction" do
    assert_difference('LocalAttraction.count') do
      post :create, local_attraction: { attraction_type: @local_attraction.attraction_type, details: @local_attraction.details, price: @local_attraction.price }
    end

    assert_redirected_to local_attraction_path(assigns(:local_attraction))
  end

  test "should show local_attraction" do
    get :show, id: @local_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_attraction
    assert_response :success
  end

  test "should update local_attraction" do
    patch :update, id: @local_attraction, local_attraction: { attraction_type: @local_attraction.attraction_type, details: @local_attraction.details, price: @local_attraction.price }
    assert_redirected_to local_attraction_path(assigns(:local_attraction))
  end

  test "should destroy local_attraction" do
    assert_difference('LocalAttraction.count', -1) do
      delete :destroy, id: @local_attraction
    end

    assert_redirected_to local_attractions_path
  end
end
