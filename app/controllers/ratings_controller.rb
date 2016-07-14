class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to category_recipe_path(@rating.recipe.category, @rating.recipe)
    end

  end


  private

    def rating_params
      params.require(:rating).permit(:value, :recipe_id, :user_id)
    end

  # def rating_average(recipe)
    # rating = recipe.ratings.reduce(0) {|sum, rating| sum + rating.value} / (Recipe.first.ratings.count).to_f
    # rating.round(2)
  # end
end
