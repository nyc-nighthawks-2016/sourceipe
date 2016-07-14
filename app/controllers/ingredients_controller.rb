class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    @recipes = @ingredient.recipes
  end

end
