require 'test_helper'

class EbvsControllerTest < ActionController::TestCase
  setup do
    @ebv = ebvs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebvs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebv" do
    assert_difference('Ebv.count') do
      post :create, ebv: { althd: @ebv.althd, althp: @ebv.althp, animal_id: @ebv.animal_id, ced: @ebv.ced, cep: @ebv.cep, consumod: @ebv.consumod, consumop: @ebv.consumop, ctd: @ebv.ctd, ctp: @ebv.ctp, dttdird: @ebv.dttdird, dttdirp: @ebv.dttdirp, dttmatd: @ebv.dttmatd, dttmatp: @ebv.dttmatp, fecha: @ebv.fecha, gdpd: @ebv.gdpd, gdpp: @ebv.gdpp, icad: @ebv.icad, icap: @ebv.icap, irfd: @ebv.irfd, irfp: @ebv.irfp, largod: @ebv.largod, largop: @ebv.largop, nacdird: @ebv.nacdird, nacdirp: @ebv.nacdirp, nacmatd: @ebv.nacmatd, nacmatp: @ebv.nacmatp, pasoad: @ebv.pasoad, pesoadd: @ebv.pesoadd, pesoadp: @ebv.pesoadp, pesoap: @ebv.pesoap, pesoaymd: @ebv.pesoaymd, pesoaymp: @ebv.pesoaymp }
    end

    assert_redirected_to ebv_path(assigns(:ebv))
  end

  test "should show ebv" do
    get :show, id: @ebv
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebv
    assert_response :success
  end

  test "should update ebv" do
    patch :update, id: @ebv, ebv: { althd: @ebv.althd, althp: @ebv.althp, animal_id: @ebv.animal_id, ced: @ebv.ced, cep: @ebv.cep, consumod: @ebv.consumod, consumop: @ebv.consumop, ctd: @ebv.ctd, ctp: @ebv.ctp, dttdird: @ebv.dttdird, dttdirp: @ebv.dttdirp, dttmatd: @ebv.dttmatd, dttmatp: @ebv.dttmatp, fecha: @ebv.fecha, gdpd: @ebv.gdpd, gdpp: @ebv.gdpp, icad: @ebv.icad, icap: @ebv.icap, irfd: @ebv.irfd, irfp: @ebv.irfp, largod: @ebv.largod, largop: @ebv.largop, nacdird: @ebv.nacdird, nacdirp: @ebv.nacdirp, nacmatd: @ebv.nacmatd, nacmatp: @ebv.nacmatp, pasoad: @ebv.pasoad, pesoadd: @ebv.pesoadd, pesoadp: @ebv.pesoadp, pesoap: @ebv.pesoap, pesoaymd: @ebv.pesoaymd, pesoaymp: @ebv.pesoaymp }
    assert_redirected_to ebv_path(assigns(:ebv))
  end

  test "should destroy ebv" do
    assert_difference('Ebv.count', -1) do
      delete :destroy, id: @ebv
    end

    assert_redirected_to ebvs_path
  end
end
