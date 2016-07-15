class SearchController < ApplicationController

  def query
    search = Search.new(params[:search])
    @recipes = search.recipes
    @ingredients = search.ingredients
    render 'results'
  end

end
