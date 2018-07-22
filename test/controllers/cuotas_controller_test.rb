require 'test_helper'

class CuotasControllerTest < ActionController::TestCase
  setup do
    @cuota = cuotas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuotas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuota" do
    assert_difference('Cuota.count') do
      post :create, cuota: { cuota: @cuota.cuota, fecha: @cuota.fecha, importe: @cuota.importe, transaccion_id: @cuota.transaccion_id }
    end

    assert_redirected_to cuota_path(assigns(:cuota))
  end

  test "should show cuota" do
    get :show, id: @cuota
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuota
    assert_response :success
  end

  test "should update cuota" do
    patch :update, id: @cuota, cuota: { cuota: @cuota.cuota, fecha: @cuota.fecha, importe: @cuota.importe, transaccion_id: @cuota.transaccion_id }
    assert_redirected_to cuota_path(assigns(:cuota))
  end

  test "should destroy cuota" do
    assert_difference('Cuota.count', -1) do
      delete :destroy, id: @cuota
    end

    assert_redirected_to cuotas_path
  end
end
