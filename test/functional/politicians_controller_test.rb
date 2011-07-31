require 'test_helper'

class PoliticiansControllerTest < ActionController::TestCase
  setup do
    @politician = politicians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:politicians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create politician" do
    assert_difference('Politician.count') do
      post :create, :politician => @politician.attributes
    end

    assert_redirected_to politician_path(assigns(:politician))
  end

  test "should show politician" do
    get :show, :id => @politician.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @politician.to_param
    assert_response :success
  end

  test "should update politician" do
    put :update, :id => @politician.to_param, :politician => @politician.attributes
    assert_redirected_to politician_path(assigns(:politician))
  end

  test "should destroy politician" do
    assert_difference('Politician.count', -1) do
      delete :destroy, :id => @politician.to_param
    end

    assert_redirected_to politicians_path
  end
end
