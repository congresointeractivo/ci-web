require 'test_helper'

class DiputadosControllerTest < ActionController::TestCase
  setup do
    @diputado = Diputado.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diputados)
  end

  test "should show diputado" do
    get :show, :id => @diputado.to_param
    assert_response :success
  end
  
end
