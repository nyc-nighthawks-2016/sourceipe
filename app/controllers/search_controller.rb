class SearchController < ApplicationController

  def query
    recipes = PgSearch.multisearch(params[:search]).where(:searchable_type => "Recipe")
    ingredients = PgSearch.multisearch(params[:search]).where(:searchable_type => "Ingredient")

    @recipes = []
    recipes.each do |recipe|
      @recipes << Recipe.find_by(id: recipe.searchable_id)
    end

    @ingredients = []
    ingredients.each do |ingredient|
      @ingredients << Ingredient.find_by(id: ingredient.searchable_id)
    end

    render 'results'
  end

end
