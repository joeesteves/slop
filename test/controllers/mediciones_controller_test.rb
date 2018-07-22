require 'test_helper'

class MedicionesControllerTest < ActionController::TestCase
  setup do
    @medicion = mediciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mediciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicion" do
    assert_difference('Medicion.count') do
      post :create, medicion: { adpv: @medicion.adpv, adpvna: @medicion.adpvna, ce: @medicion.ce, fecha: @medicion.fecha, mediciontipo_id: @medicion.mediciontipo_id, peso: @medicion.peso }
    end

    assert_redirected_to medicion_path(assigns(:medicion))
  end

  test "should show medicion" do
    get :show, id: @medicion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicion
    assert_response :success
  end

  test "should update medicion" do
    patch :update, id: @medicion, medicion: { adpv: @medicion.adpv, adpvna: @medicion.adpvna, ce: @medicion.ce, fecha: @medicion.fecha, mediciontipo_id: @medicion.mediciontipo_id, peso: @medicion.peso }
    assert_redirected_to medicion_path(assigns(:medicion))
  end

  test "should destroy medicion" do
    assert_difference('Medicion.count', -1) do
      delete :destroy, id: @medicion
    end

    assert_redirected_to mediciones_path
  end
end
