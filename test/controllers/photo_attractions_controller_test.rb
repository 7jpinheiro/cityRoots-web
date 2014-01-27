require 'test_helper'

class PhotoAttractionsControllerTest < ActionController::TestCase
  setup do
    @photo_attraction = photo_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_attraction" do
    assert_difference('PhotoAttraction.count') do
      post :create, photo_attraction: { description: @photo_attraction.description, extension: @photo_attraction.extension, name: @photo_attraction.name, url: @photo_attraction.url }
    end

    assert_redirected_to attraction_photo_attraction_path(assigns(:photo_attraction))
  end

  test "should show photo_attraction" do
    get :show, id: @photo_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_attraction
    assert_response :success
  end

  test "should update photo_attraction" do
    patch :update, id: @photo_attraction, photo_attraction: { description: @photo_attraction.description, extension: @photo_attraction.extension, name: @photo_attraction.name, url: @photo_attraction.url }
    assert_redirected_to attraction_photo_attraction_path(assigns(:photo_attraction))
  end

  test "should destroy photo_attraction" do
    assert_difference('PhotoAttraction.count', -1) do
      delete :destroy, id: @photo_attraction
    end

    assert_redirected_to attraction_photo_attractions_path
  end
end
