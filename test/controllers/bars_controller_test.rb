require 'test_helper'

class BarsControllerTest < ActionController::TestCase
  setup do
    @bar = bars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bar" do
    assert_difference('Bar.count') do
      post :create, bar: { address: @bar.address, alcohol: @bar.alcohol, ambience: @bar.ambience, goodfordancing: @bar.goodfordancing, goodforgroups: @bar.goodforgroups, happyhour: @bar.happyhour, hastv: @bar.hastv, name: @bar.name, noiselevel: @bar.noiselevel, parking: @bar.parking, phone: @bar.phone, smoking: @bar.smoking, takesreservation: @bar.takesreservation, timing: @bar.timing, zipcode: @bar.zipcode }
    end

    assert_redirected_to bar_path(assigns(:bar))
  end

  test "should show bar" do
    get :show, id: @bar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bar
    assert_response :success
  end

  test "should update bar" do
    patch :update, id: @bar, bar: { address: @bar.address, alcohol: @bar.alcohol, ambience: @bar.ambience, goodfordancing: @bar.goodfordancing, goodforgroups: @bar.goodforgroups, happyhour: @bar.happyhour, hastv: @bar.hastv, name: @bar.name, noiselevel: @bar.noiselevel, parking: @bar.parking, phone: @bar.phone, smoking: @bar.smoking, takesreservation: @bar.takesreservation, timing: @bar.timing, zipcode: @bar.zipcode }
    assert_redirected_to bar_path(assigns(:bar))
  end

  test "should destroy bar" do
    assert_difference('Bar.count', -1) do
      delete :destroy, id: @bar
    end

    assert_redirected_to bars_path
  end
end
