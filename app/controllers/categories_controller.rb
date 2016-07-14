class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @recipes =  Category.find_by(id: params[:id]).recipes
  end

end
