require 'test_helper'

class EventotiposControllerTest < ActionController::TestCase
  setup do
    @eventotipo = eventotipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventotipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventotipo" do
    assert_difference('Eventotipo.count') do
      post :create, eventotipo: { codigo: @eventotipo.codigo, desc: @eventotipo.desc, nombre: @eventotipo.nombre }
    end

    assert_redirected_to eventotipo_path(assigns(:eventotipo))
  end

  test "should show eventotipo" do
    get :show, id: @eventotipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventotipo
    assert_response :success
  end

  test "should update eventotipo" do
    patch :update, id: @eventotipo, eventotipo: { codigo: @eventotipo.codigo, desc: @eventotipo.desc, nombre: @eventotipo.nombre }
    assert_redirected_to eventotipo_path(assigns(:eventotipo))
  end

  test "should destroy eventotipo" do
    assert_difference('Eventotipo.count', -1) do
      delete :destroy, id: @eventotipo
    end

    assert_redirected_to eventotipos_path
  end
end
