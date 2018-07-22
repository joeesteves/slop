require 'test_helper'

class MediciontiposControllerTest < ActionController::TestCase
  setup do
    @mediciontipo = mediciontipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mediciontipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mediciontipo" do
    assert_difference('Mediciontipo.count') do
      post :create, mediciontipo: { codigo: @mediciontipo.codigo, nombre: @mediciontipo.nombre }
    end

    assert_redirected_to mediciontipo_path(assigns(:mediciontipo))
  end

  test "should show mediciontipo" do
    get :show, id: @mediciontipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mediciontipo
    assert_response :success
  end

  test "should update mediciontipo" do
    patch :update, id: @mediciontipo, mediciontipo: { codigo: @mediciontipo.codigo, nombre: @mediciontipo.nombre }
    assert_redirected_to mediciontipo_path(assigns(:mediciontipo))
  end

  test "should destroy mediciontipo" do
    assert_difference('Mediciontipo.count', -1) do
      delete :destroy, id: @mediciontipo
    end

    assert_redirected_to mediciontipos_path
  end
end
