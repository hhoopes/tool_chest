require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "any user sees categories index" do
    user = User.create(username: "JoeUser",
                        password: "password",
                        role: 0)

    admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit categories_path

    within("#categories") do
      assert page.has_content?("All Categories")
    end

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit categories_path

    within("#categories") do
      assert page.has_content?("All Categories")
    end

  end

  # test "default user cannot see admin categories index" do
  #   default_user = User.create(username: "user",
  #                             password: "123",
  #                             role: 0)
  #   ApplicationController.any_instance.stubs(:current_user).returns(default_user)
  #
  #   visit admin_categories_path
  #
  #   refute page.has_content?("All Categories")
  #   assert page.has_content?("The page you were looking for doesn't exist.")
  # end
end
