class HomeController < ApplicationController

  def index
    @appetizers = Category.find_by(name: "Appetizers")
    @salads = Category.find_by(name: "Salads")
    @entrees = Category.find_by(name: "Entrees")
    @desserts = Category.find_by(name: "Desserts")

    # @top_appetizers = top_rated(Category.find_by(name: "Appetizers").recipes)
    # @top_salads = top_rated(Category.find_by(name: "Salads").recipes)
    # @top_entrees = top_rated(Category.find_by(name: "Entrees").recipes)
    # @top_desserts = top_rated(Category.find_by(name: "Desserts").recipes)
  end
end
