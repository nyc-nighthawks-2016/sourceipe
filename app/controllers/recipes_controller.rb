class RecipesController < ApplicationController
  before_action :find_category, except: :index

  def index
    @recipes = Recipe.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @component = Component.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    category = Category.find_by_name(params[:recipe][:category])
    @recipe[:category_id] = category.id

    if @recipe.save
      redirect_to category_recipe_path(@recipe.category, @recipe)
    else
      flash[:notice] = "Looks like you've already uploaded a recipe for this category."
      render 'new'
    end

  end

  def edit
    current_user
    @recipe = Recipe.find_by_id(params[:id]) 
    not_found if @current_user != @recipe.user
    @category = @recipe.category
    @component = @recipe.components.new

  end

  private

  def find_category
    @category = Category.find_by_id(params[:category_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :prep_time, :difficulty, :author)
  end
end
