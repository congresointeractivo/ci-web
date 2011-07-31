require 'test_helper'

class DiputadosControllerTest < ActionController::TestCase
  setup do
    @diputado = diputados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diputados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diputado" do
    assert_difference('Diputado.count') do
      post :create, :diputado => @diputado.attributes
    end

    assert_redirected_to diputado_path(assigns(:diputado))
  end

  test "should show diputado" do
    get :show, :id => @diputado.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @diputado.to_param
    assert_response :success
  end

  test "should update diputado" do
    put :update, :id => @diputado.to_param, :diputado => @diputado.attributes
    assert_redirected_to diputado_path(assigns(:diputado))
  end

  test "should destroy diputado" do
    assert_difference('Diputado.count', -1) do
      delete :destroy, :id => @diputado.to_param
    end

    assert_redirected_to diputados_path
  end
end
