require 'test_helper'

class CatfiscalesControllerTest < ActionController::TestCase
  setup do
    @catfiscal = catfiscales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catfiscales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catfiscal" do
    assert_difference('Catfiscal.count') do
      post :create, catfiscal: { codigo: @catfiscal.codigo, iva: @catfiscal.iva, nombre: @catfiscal.nombre }
    end

    assert_redirected_to catfiscal_path(assigns(:catfiscal))
  end

  test "should show catfiscal" do
    get :show, id: @catfiscal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catfiscal
    assert_response :success
  end

  test "should update catfiscal" do
    patch :update, id: @catfiscal, catfiscal: { codigo: @catfiscal.codigo, iva: @catfiscal.iva, nombre: @catfiscal.nombre }
    assert_redirected_to catfiscal_path(assigns(:catfiscal))
  end

  test "should destroy catfiscal" do
    assert_difference('Catfiscal.count', -1) do
      delete :destroy, id: @catfiscal
    end

    assert_redirected_to catfiscales_path
  end
end
