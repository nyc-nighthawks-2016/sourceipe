class CategoryController < ApplicationController

  def index

    @appetizers = Category.find_by_id(1)
    @salads = Category.find_by_id(2)
    @entrees = Category.find_by_id(3)
    @deserts = Category.find_by_id(4)

  end

  def show
    @category = Category.find_by_id params[:id]
  end

end
