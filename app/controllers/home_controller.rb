class HomeController < ApplicationController

  def index
    @appetizers = Category.find_by_id(1)
    @salads = Category.find_by_id(2)
    @entrees = Category.find_by_id(3)
    @desserts = Category.find_by_id(4)

  end
end
