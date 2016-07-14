class Search

  attr_reader :recipes, :ingredients, :search_terms

  def initialize(args)
    @search_terms = args.split(/\s+/)

    @recipes = []
    @ingredients = []
    recipes = PgSearch.multisearch(args).where(:searchable_type => "Recipe")
    ingredients = PgSearch.multisearch(args).where(:searchable_type => "Ingredient")

    recipes.each do |recipe|
      @recipes << Recipe.find_by(id: recipe.searchable_id)
    end

    ingredients.each do |ingredient|
      @ingredients << Ingredient.find_by(id: ingredient.searchable_id)
    end
    binding.pry
    # self.recipes
    # self.ingredients
  end

  def recipes
    @search_terms.each do |term|
      recipes = PgSearch.multisearch(term).where(:searchable_type => "Recipe")
      recipes.each do |recipe|
        @recipes << Recipe.find_by(id: recipe.searchable_id)
      end
    end
  end

  def ingredients
    @search_terms.each do |term|
      ingredients = PgSearch.multisearch(term).where(:searchable_type => "Ingredient")
      ingredients.each do |ingredient|
          @ingredients << Ingredient.find_by(id: ingredient.searchable_id)
      end
    end
  end

end
