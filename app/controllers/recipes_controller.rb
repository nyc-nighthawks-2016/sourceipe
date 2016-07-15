class RecipesController < ApplicationController
  before_action :find_category, except: :index

  def index
    @recipes = Recipe.order(created_at: :desc)
  end

  def new
    redirect_to '/login' if !logged_in?
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @component = Component.new
    if @current_user
      if !Rating.find_by(user: current_user, recipe: @recipe)
        @rating = current_user.ratings.new
      else
        @rating = Rating.find_by(user: current_user, recipe: @recipe)
      end
    end
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
    @measurements = Measurement.all
  end

  def update
    current_user
    @recipe = Recipe.find_by(id: params[:id])
    not_found if @current_user != @recipe.user
    if @recipe.update(recipe_params)
      redirect_to category_recipe_path(@recipe.category, @recipe)
    else
      @component = @recipe.components.new
      render 'edit'
    end
  end

  def destroy
    current_user
    @recipe = Recipe.find_by_id(params[:id])
    if @current_user == @recipe.user
      @recipe.destroy
      redirect_to user_path(@current_user)
    else
      not_found
    end
  end
  private

  def find_category
    @category = Category.find_by_id(params[:category_id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :prep_time, :difficulty, :author)
  end
end
