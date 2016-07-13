class RecipesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
  end

  def new
  end

  def show
  end

end
