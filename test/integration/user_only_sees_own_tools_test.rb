require 'test_helper'

class UserOnlySeesOwnToolsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user sees own tools when logged in" do
    user = User.create(username: "Marvin", password: "password")
    user.tools << Tool.new(name: "Hammer", price: 5555, quantity: 3)

    user2 = User.create(username: "Frances", password: "password")
    user2.tools << Tool.new(name: "Saw", price: 5555, quantity: 3)

    visit login_path
    fill_in "Username", with: "Marvin"
    fill_in "Password", with: "password"
    click_on "Login"

    visit tools_path

    assert page.has_content? "Hammer"
    refute page.has_content? "Saw"

  end
end
