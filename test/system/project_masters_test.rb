require "application_system_test_case"

class ProjectMastersTest < ApplicationSystemTestCase
  setup do
    @project_master = project_masters(:one)
  end

  test "visiting the index" do
    visit project_masters_url
    assert_selector "h1", text: "Project masters"
  end

  test "should create project master" do
    visit project_masters_url
    click_on "New project master"

    fill_in "Description", with: @project_master.description
    fill_in "Name", with: @project_master.name
    fill_in "User", with: @project_master.user_id
    click_on "Create Project master"

    assert_text "Project master was successfully created"
    click_on "Back"
  end

  test "should update Project master" do
    visit project_master_url(@project_master)
    click_on "Edit this project master", match: :first

    fill_in "Description", with: @project_master.description
    fill_in "Name", with: @project_master.name
    fill_in "User", with: @project_master.user_id
    click_on "Update Project master"

    assert_text "Project master was successfully updated"
    click_on "Back"
  end

  test "should destroy Project master" do
    visit project_master_url(@project_master)
    click_on "Destroy this project master", match: :first

    assert_text "Project master was successfully destroyed"
  end
end
