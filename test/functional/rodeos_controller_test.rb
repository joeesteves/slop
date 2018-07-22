require 'test_helper'

class RodeosControllerTest < ActionController::TestCase
  setup do
    @rodeo = rodeos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rodeos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rodeo" do
    assert_difference('Rodeo.count') do
      post :create, rodeo: { desc: @rodeo.desc, nombre: @rodeo.nombre }
    end

    assert_redirected_to rodeo_path(assigns(:rodeo))
  end

  test "should show rodeo" do
    get :show, id: @rodeo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rodeo
    assert_response :success
  end

  test "should update rodeo" do
    put :update, id: @rodeo, rodeo: { desc: @rodeo.desc, nombre: @rodeo.nombre }
    assert_redirected_to rodeo_path(assigns(:rodeo))
  end

  test "should destroy rodeo" do
    assert_difference('Rodeo.count', -1) do
      delete :destroy, id: @rodeo
    end

    assert_redirected_to rodeos_path
  end
end
