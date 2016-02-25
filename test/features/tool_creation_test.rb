require "test_helper"

class ToolCreationTest < ActionDispatch::IntegrationTest
  test "user can create a tool" do
    skip #needs a logged in user

    visit new_tool_path

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "10"
    click_link_or_button "Create Tool"

    assert_equal current_path, tool_path(Tool.last)

      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("10")

  end
end
