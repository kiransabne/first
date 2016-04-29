require 'test_helper'

class TouristspotsControllerTest < ActionController::TestCase
  setup do
    @touristspot = touristspots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:touristspots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create touristspot" do
    assert_difference('Touristspot.count') do
      post :create, touristspot: { description: @touristspot.description, location: @touristspot.location, name: @touristspot.name, shortinfo: @touristspot.shortinfo }
    end

    assert_redirected_to touristspot_path(assigns(:touristspot))
  end

  test "should show touristspot" do
    get :show, id: @touristspot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @touristspot
    assert_response :success
  end

  test "should update touristspot" do
    patch :update, id: @touristspot, touristspot: { description: @touristspot.description, location: @touristspot.location, name: @touristspot.name, shortinfo: @touristspot.shortinfo }
    assert_redirected_to touristspot_path(assigns(:touristspot))
  end

  test "should destroy touristspot" do
    assert_difference('Touristspot.count', -1) do
      delete :destroy, id: @touristspot
    end

    assert_redirected_to touristspots_path
  end
end
