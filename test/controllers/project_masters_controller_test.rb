require "test_helper"

class ProjectMastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_master = project_masters(:one)
  end

  test "should get index" do
    get project_masters_url
    assert_response :success
  end

  test "should get new" do
    get new_project_master_url
    assert_response :success
  end

  test "should create project_master" do
    assert_difference("ProjectMaster.count") do
      post project_masters_url, params: { project_master: { description: @project_master.description, name: @project_master.name, user_id: @project_master.user_id } }
    end

    assert_redirected_to project_master_url(ProjectMaster.last)
  end

  test "should show project_master" do
    get project_master_url(@project_master)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_master_url(@project_master)
    assert_response :success
  end

  test "should update project_master" do
    patch project_master_url(@project_master), params: { project_master: { description: @project_master.description, name: @project_master.name, user_id: @project_master.user_id } }
    assert_redirected_to project_master_url(@project_master)
  end

  test "should destroy project_master" do
    assert_difference("ProjectMaster.count", -1) do
      delete project_master_url(@project_master)
    end

    assert_redirected_to project_masters_url
  end
end
