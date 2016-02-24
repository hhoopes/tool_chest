require 'test_helper'

class UserCanEditAnExistingToolTest <ActionDispatch::IntegrationTest
  test "user can edit an existing tool" do

    tool = Tool.create(name: "Screwdriver", quantity: 30, price: 1999)
    user = User.create(username: "User", role: 0, password: "123")
    user.tools << tool
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit edit_user_tool_path(user, tool)

    fill_in "Name", with: "Wrench"
    fill_in "tool[quantity]", with: "3" #can use either label or name
    fill_in "Price", with: "2000"

    click_link_or_button "Update Tool"

    assert_equal current_path, user_tool_path(user, tool)
  end

end
