require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees dashboard change identity" do
    user = User.create(username: "Marvin", password: "password")
    visit login_path

    fill_in "Username", with: "Marvin"

    fill_in "Password", with: "password"

    click_on "Login"

    click_on "Log Out"

    assert_equal '/', current_path

    assert page.has_content? "Welcome"
  end
end
