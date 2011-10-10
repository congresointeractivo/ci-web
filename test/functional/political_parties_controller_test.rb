require 'test_helper'

class PoliticalPartiesControllerTest < ActionController::TestCase
  setup do
    @political_party = PoliticalParty.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:political_parties)
  end

  test "should show political_party" do
    get :show, :id => @political_party.to_param
    assert_response :success
  end

end
