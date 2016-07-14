class Search

  attr_reader :recipes, :ingredients, :search_terms

  def initialize(args)
    @search_terms = args.split(/\s+/)

    @recipes = []
    @ingredients = []
    recipes_results = PgSearch.multisearch(args).where(:searchable_type => "Recipe")
    ingredients_results = PgSearch.multisearch(args).where(:searchable_type => "Ingredient")

    recipes_results.each do |recipe|
      @recipes << Recipe.find_by(id: recipe.searchable_id)
    end

    ingredients_results.each do |ingredient|
      @ingredients << Ingredient.find_by(id: ingredient.searchable_id)
    end

    self.recipe_single_term
    self.ingredient_single_term
  end

  def recipe_single_term
    @search_terms.each do |term|
      recipes = PgSearch.multisearch(term).where(:searchable_type => "Recipe")
      recipes.each do |recipe|
        @recipes << Recipe.find_by(id: recipe.searchable_id)
      end
    end
  end

  def ingredient_single_term
    @search_terms.each do |term|
      ingredients = PgSearch.multisearch(term).where(:searchable_type => "Ingredient")
      ingredients.each do |ingredient|
          @ingredients << Ingredient.find_by(id: ingredient.searchable_id)
      end
    end
  end

end
