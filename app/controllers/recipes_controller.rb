class RecipesController < ApplicationController
  before_action :find_category, except: :index

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:category_id])
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to category_recipe_path(@category, @recipe)
    else
      render 'new'
    end

  end

  private

  def find_category
    # binding.pry
    @category = Category.find(params[:category_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :prep_time, :difficulty, :author, :category_id)
  end
end
