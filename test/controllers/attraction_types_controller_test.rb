require 'test_helper'

class AttractionTypesControllerTest < ActionController::TestCase
  setup do
    @attraction_type = attraction_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attraction_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction_type" do
    assert_difference('AttractionType.count') do
      post :create, attraction_type: { attraction_big_types_id: @attraction_type.attraction_big_types_id, description: @attraction_type.description, name: @attraction_type.name }
    end

    assert_redirected_to attraction_attraction_type_path(assigns(:attraction_type))
  end

  test "should show attraction_type" do
    get :show, id: @attraction_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction_type
    assert_response :success
  end

  test "should update attraction_type" do
    patch :update, id: @attraction_type, attraction_type: { attraction_big_types_id: @attraction_type.attraction_big_types_id, description: @attraction_type.description, name: @attraction_type.name }
    assert_redirected_to attraction_attraction_type_path(assigns(:attraction_type))
  end

  test "should destroy attraction_type" do
    assert_difference('AttractionType.count', -1) do
      delete :destroy, id: @attraction_type
    end

    assert_redirected_to attraction_types_path
  end
end
