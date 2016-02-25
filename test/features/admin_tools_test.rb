require 'test_helper'

class AdminCanEditAnExistingToolTest <ActionDispatch::IntegrationTest

  test "admin can edit an existing tool" do

    tool = Tool.create(name: "Screwdriver", quantity: 30, price: 1999)
    user = User.create(username: "JoeUser", password: "123", role: 0)
    user.tools << tool

    admin = User.create(username: "admin", password: "123", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit edit_admin_tool_path(tool)

    fill_in "Name", with: "Wrench"
    fill_in "tool[quantity]", with: "3" #can use either label or name
    fill_in "Price", with: "2000"

    click_link_or_button "Update Tool"

    assert_equal current_path, admin_tool_path(tool)
  end

end
