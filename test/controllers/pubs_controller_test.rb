require 'test_helper'

class PubsControllerTest < ActionController::TestCase
  setup do
    @pub = pubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pub" do
    assert_difference('Pub.count') do
      post :create, pub: { address: @pub.address, alcoho: @pub.alcoho, ambience: @pub.ambience, bar: @pub.bar, goodfordancing: @pub.goodfordancing, goodforgroups: @pub.goodforgroups, happyhour: @pub.happyhour, hastv: @pub.hastv, name: @pub.name, noiselevel: @pub.noiselevel, parking: @pub.parking, phone: @pub.phone, smoking: @pub.smoking, takesreservation: @pub.takesreservation, timing: @pub.timing, zipcode: @pub.zipcode }
    end

    assert_redirected_to pub_path(assigns(:pub))
  end

  test "should show pub" do
    get :show, id: @pub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pub
    assert_response :success
  end

  test "should update pub" do
    patch :update, id: @pub, pub: { address: @pub.address, alcoho: @pub.alcoho, ambience: @pub.ambience, bar: @pub.bar, goodfordancing: @pub.goodfordancing, goodforgroups: @pub.goodforgroups, happyhour: @pub.happyhour, hastv: @pub.hastv, name: @pub.name, noiselevel: @pub.noiselevel, parking: @pub.parking, phone: @pub.phone, smoking: @pub.smoking, takesreservation: @pub.takesreservation, timing: @pub.timing, zipcode: @pub.zipcode }
    assert_redirected_to pub_path(assigns(:pub))
  end

  test "should destroy pub" do
    assert_difference('Pub.count', -1) do
      delete :destroy, id: @pub
    end

    assert_redirected_to pubs_path
  end
end
