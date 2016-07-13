class RecipesController < ApplicationController
  def index
    @category = Category.find(params[:id])
  end

  def new
  end

  def show
  end

end
