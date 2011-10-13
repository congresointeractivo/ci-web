require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = Project.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should show project" do
    get :show, :id => @project.to_param
    assert_response :success
  end
end
