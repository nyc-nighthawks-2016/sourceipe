class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
  end

  def show
  end

end
