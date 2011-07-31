require 'test_helper'

class SenadoresControllerTest < ActionController::TestCase
  setup do
    @senadore = senadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:senadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create senadore" do
    assert_difference('Senadore.count') do
      post :create, :senadore => @senadore.attributes
    end

    assert_redirected_to senadore_path(assigns(:senadore))
  end

  test "should show senadore" do
    get :show, :id => @senadore.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @senadore.to_param
    assert_response :success
  end

  test "should update senadore" do
    put :update, :id => @senadore.to_param, :senadore => @senadore.attributes
    assert_redirected_to senadore_path(assigns(:senadore))
  end

  test "should destroy senadore" do
    assert_difference('Senadore.count', -1) do
      delete :destroy, :id => @senadore.to_param
    end

    assert_redirected_to senadores_path
  end
end
