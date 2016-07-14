class HomeController < ApplicationController

  def index
    @appetizers = Category.find_by(name: "Appetizers").top_recipes
    @salads = Category.find_by(name: "Salads").top_recipes
    @entrees = Category.find_by(name: "Entrees").top_recipes
    @desserts = Category.find_by(name: "Desserts").top_recipes

    # @top_appetizers = top_rated(Category.find_by(name: "Appetizers").recipes)
    # @top_salads = top_rated(Category.find_by(name: "Salads").recipes)
    # @top_entrees = top_rated(Category.find_by(name: "Entrees").recipes)
    # @top_desserts = top_rated(Category.find_by(name: "Desserts").recipes)
  end
end
