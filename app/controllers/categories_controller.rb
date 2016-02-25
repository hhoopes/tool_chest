class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
  end
end
