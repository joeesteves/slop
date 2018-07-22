require 'test_helper'

class TipoAccsControllerTest < ActionController::TestCase
  setup do
    @tipo_acc = tipo_accs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_accs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_acc" do
    assert_difference('TipoAcc.count') do
      post :create, tipo_acc: { codigo: @tipo_acc.codigo, nombre: @tipo_acc.nombre }
    end

    assert_redirected_to tipo_acc_path(assigns(:tipo_acc))
  end

  test "should show tipo_acc" do
    get :show, id: @tipo_acc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_acc
    assert_response :success
  end

  test "should update tipo_acc" do
    put :update, id: @tipo_acc, tipo_acc: { codigo: @tipo_acc.codigo, nombre: @tipo_acc.nombre }
    assert_redirected_to tipo_acc_path(assigns(:tipo_acc))
  end

  test "should destroy tipo_acc" do
    assert_difference('TipoAcc.count', -1) do
      delete :destroy, id: @tipo_acc
    end

    assert_redirected_to tipo_accs_path
  end
end
