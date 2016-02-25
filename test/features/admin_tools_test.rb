require 'test_helper'

class AdminCanAddViewDeleteToolsTest <ActionDispatch::IntegrationTest

  test "admin can add an existing tool" do
    admin = User.create(username: "admin", password: "123", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_tool_path

    fill_in "Name", with: "Wrench"
    fill_in "tool[quantity]", with: "3" #can use either label or name
    fill_in "Price", with: "2000"

    click_link_or_button "Create Tool"

    tool = Tool.last
    assert_equal current_path, admin_tool_path(tool)
    assert page.has_content?("Wrench")
  end

  test "admin can view all tools" do

    user = User.create(username: "JillUser", password: "123", role: 0)
    user.tools << Tool.create(name: "jackhammer", price: 33, quantity: 3)
    admin = User.create(username: "admin", password: "123", role: 1)
    admin.tools << Tool.create(name: "rasp", price: 33, quantity: 3)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_tools_path

    assert page.has_content?("jackhammer")
    assert page.has_content?("rasp")
  end

  test "admin can delete any tool" do
    user = User.create(username: "JillUser", password: "123", role: 0)
    user.tools << Tool.create(name: "jackhammer", price: 33, quantity: 3)
    admin = User.create(username: "admin", password: "123", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    tool = Tool.last
    visit admin_tool_path(tool)

    click_link_or_button "Delete"
    assert_equal admin_tools_path, current_path

    admin.tools << Tool.create(name: "rasp", price: 33, quantity: 3)
    tool = Tool.last
    visit admin_tool_path(tool)

    click_link_or_button "Delete"
    assert_equal admin_tools_path, current_path
  end
end
