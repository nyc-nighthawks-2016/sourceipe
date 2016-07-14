class ComponentsController < ApplicationController
  def create
    @recipe = Recipe.find_by_id(component_params[:recipe_id])
    current_user
    not_found if @current_user != @recipe.user
    @ingredient = Ingredient.find_or_create_by(name: component_params[:ingredient])
    @measurement = Measurement.find_or_create_by(unit: component_params[:measurement])
    @component = Component.new(ingredient: @ingredient, measurement: @measurement, recipe: @recipe, quantity: component_params[:quantity])
    if @component.save
      flash[:notice] = "Component Added"
    else
      flash[:notice] = "Invalid Component"
    end
    redirect_to edit_category_recipe_path(@recipe.category, @recipe)
  end

  private

  def component_params
    params.require(:component).permit(:ingredient, :quantity, :measurement, :recipe_id)
  end
end
