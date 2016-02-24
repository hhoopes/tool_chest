require 'test_helper'

class UserCanEditAnExistingToolTest <ActionDispatch::IntegrationTest
  test "user can edit an existing tool" do

    tool = Tool.create(name: "Screwdriver", quantity: 30, price: 1999)

    visit edit_tool_path(tool)

    fill_in "Name", with: "Wrench"
    fill_in "tool[quantity]", with: "3" #can use either label or name
    fill_in "Price", with: "2000"

    click_link_or_button "Update Tool"

    assert_equal current_path, tool_path(tool)
  end

end
