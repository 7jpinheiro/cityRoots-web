require 'test_helper'

class AttractionsControllerTest < ActionController::TestCase
  setup do
    @attraction = attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction" do
    assert_difference('Attraction.count') do
      post :create, attraction: { active: @attraction.active, address: @attraction.address, attraction_type_id: @attraction.attraction_type_id, city_id: @attraction.city_id, coord: @attraction.coord, description: @attraction.description, details: @attraction.details, email: @attraction.email, name: @attraction.name, price: @attraction.price, reference_point: @attraction.reference_point, schedule: @attraction.schedule, site: @attraction.site, timestamp: @attraction.timestamp, transport: @attraction.transport, web_user_id: @attraction.web_user_id }
    end

    assert_redirected_to attraction_path(assigns(:attraction))
  end

  test "should show attraction" do
    get :show, id: @attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction
    assert_response :success
  end

  test "should update attraction" do
    patch :update, id: @attraction, attraction: { active: @attraction.active, address: @attraction.address, attraction_type_id: @attraction.attraction_type_id, city_id: @attraction.city_id, coord: @attraction.coord, description: @attraction.description, details: @attraction.details, email: @attraction.email, name: @attraction.name, price: @attraction.price, reference_point: @attraction.reference_point, schedule: @attraction.schedule, site: @attraction.site, timestamp: @attraction.timestamp, transport: @attraction.transport, web_user_id: @attraction.web_user_id }
    assert_redirected_to attraction_path(assigns(:attraction))
  end

  test "should destroy attraction" do
    assert_difference('Attraction.count', -1) do
      delete :destroy, id: @attraction
    end

    assert_redirected_to attractions_path
  end
end
