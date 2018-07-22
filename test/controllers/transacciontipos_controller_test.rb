require 'test_helper'

class TransacciontiposControllerTest < ActionController::TestCase
  setup do
    @transacciontipo = transacciontipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transacciontipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transacciontipo" do
    assert_difference('Transacciontipo.count') do
      post :create, transacciontipo: { codigo: @transacciontipo.codigo, nombre: @transacciontipo.nombre }
    end

    assert_redirected_to transacciontipo_path(assigns(:transacciontipo))
  end

  test "should show transacciontipo" do
    get :show, id: @transacciontipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transacciontipo
    assert_response :success
  end

  test "should update transacciontipo" do
    patch :update, id: @transacciontipo, transacciontipo: { codigo: @transacciontipo.codigo, nombre: @transacciontipo.nombre }
    assert_redirected_to transacciontipo_path(assigns(:transacciontipo))
  end

  test "should destroy transacciontipo" do
    assert_difference('Transacciontipo.count', -1) do
      delete :destroy, id: @transacciontipo
    end

    assert_redirected_to transacciontipos_path
  end
end
