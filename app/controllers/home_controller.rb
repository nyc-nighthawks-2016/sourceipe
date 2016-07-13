class HomeController < ApplicationController

  def index
    @appetizers = Category.find_by(name: "Appetizers")
    @salads = Category.find_by(name: "Salads")
    @entrees = Category.find_by(name: "Entrees")
    @desserts = Category.find_by(name: "Desserts")
  end
end
