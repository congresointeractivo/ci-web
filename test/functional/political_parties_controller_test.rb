require 'test_helper'

class PoliticalPartiesControllerTest < ActionController::TestCase
  setup do
    @political_party = political_parties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:political_parties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create political_party" do
    assert_difference('PoliticalParty.count') do
      post :create, :political_party => @political_party.attributes
    end

    assert_redirected_to political_party_path(assigns(:political_party))
  end

  test "should show political_party" do
    get :show, :id => @political_party.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @political_party.to_param
    assert_response :success
  end

  test "should update political_party" do
    put :update, :id => @political_party.to_param, :political_party => @political_party.attributes
    assert_redirected_to political_party_path(assigns(:political_party))
  end

  test "should destroy political_party" do
    assert_difference('PoliticalParty.count', -1) do
      delete :destroy, :id => @political_party.to_param
    end

    assert_redirected_to political_parties_path
  end
end
