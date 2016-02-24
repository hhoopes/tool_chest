require 'test_helper'

class UserCreatesAnAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test 'user sees name on dashboard' do

    visit '/'

    click_on "Create Account"

    fill_in "Username", with: "heidi"

    fill_in "Password", with: "password"

    click_on "Register"

    user = User.last

    assert_equal "/users/#{user.id}", current_path

    assert page.has_content? "Welcome, heidi"
  end
end
