require 'test_helper'

class SenatorsControllerTest < ActionController::TestCase
  setup do
    @senator = Senator.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:senators)
  end
  
  test "should show senator" do
    get :show, :id => @senator.to_param
    assert_response :success
  end
end
