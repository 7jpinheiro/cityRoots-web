require 'test_helper'

class AttractionBigTypesControllerTest < ActionController::TestCase
  setup do
    @attraction_big_type = attraction_big_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attraction_big_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction_big_type" do
    assert_difference('AttractionBigType.count') do
      post :create, attraction_big_type: { description: @attraction_big_type.description, name: @attraction_big_type.name }
    end

    assert_redirected_to attraction_big_type_path(assigns(:attraction_big_type))
  end

  test "should show attraction_big_type" do
    get :show, id: @attraction_big_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction_big_type
    assert_response :success
  end

  test "should update attraction_big_type" do
    patch :update, id: @attraction_big_type, attraction_big_type: { description: @attraction_big_type.description, name: @attraction_big_type.name }
    assert_redirected_to attraction_big_type_path(assigns(:attraction_big_type))
  end

  test "should destroy attraction_big_type" do
    assert_difference('AttractionBigType.count', -1) do
      delete :destroy, id: @attraction_big_type
    end

    assert_redirected_to attraction_big_types_path
  end
end
