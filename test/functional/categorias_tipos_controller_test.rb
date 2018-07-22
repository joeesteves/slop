require 'test_helper'

class CategoriasTiposControllerTest < ActionController::TestCase
  setup do
    @categorias_tipo = categorias_tipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categorias_tipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create categorias_tipo" do
    assert_difference('CategoriasTipo.count') do
      post :create, categorias_tipo: { desc: @categorias_tipo.desc, nombre: @categorias_tipo.nombre }
    end

    assert_redirected_to categorias_tipo_path(assigns(:categorias_tipo))
  end

  test "should show categorias_tipo" do
    get :show, id: @categorias_tipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @categorias_tipo
    assert_response :success
  end

  test "should update categorias_tipo" do
    put :update, id: @categorias_tipo, categorias_tipo: { desc: @categorias_tipo.desc, nombre: @categorias_tipo.nombre }
    assert_redirected_to categorias_tipo_path(assigns(:categorias_tipo))
  end

  test "should destroy categorias_tipo" do
    assert_difference('CategoriasTipo.count', -1) do
      delete :destroy, id: @categorias_tipo
    end

    assert_redirected_to categorias_tipos_path
  end
end
