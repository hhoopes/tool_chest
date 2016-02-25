require 'test_helper'

class UserLogsOutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test 'user sees name on dashboard' do

    visit '/'

    click_on "Register"

    fill_in "Username", with: "heidi"

    fill_in "Password", with: "password"

    click_on "Create Account"

    user = User.last

    assert_equal "/users/#{user.id}", current_path

    assert page.has_content? "Welcome, heidi"
  end
end
