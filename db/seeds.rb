# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# What has been Seeded:
User.delete_all
Recipe.delete_all
Category.delete_all
Rating.delete_all
#----------------------------------------------------------------------------
# Users

users = []
100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  users << User.create!({
                         first_name: first_name,
                         last_name: last_name,
                         username: Faker::Internet.user_name("#{first_name} #{last_name[0..2]}", %w(. _ -)),
                         email: Faker::Internet.free_email("#{first_name}.#{last_name}"),
                         password: Faker::Internet.password(8, 15)})
end

#----------------------------------------------------------------------------
# Categories

categories = []
categories << Category.create(name: "Appetizers")
categories << Category.create(name: "Salads")
categories << Category.create(name: "Entrees")
categories << Category.create(name: "Desserts")

#----------------------------------------------------------------------------
# Recipes

prep_time = (1..180).to_a
difficulty = ["Beginner", "Intermediate", "Advanced"]

categories.each do |category|
  10.times do
    author = users.sample.first_name
    directions = Faker::Hipster.paragraphs(5)
    Recipe.create({
      name: "#{author}'s delicious #{Faker::Beer.name} Recipe",
      difficulty: difficulty.sample,
      prep_time: prep_time.sample,
      directions: directions,
      author: author,
      user: users.sample,
      category: category
      })
  end
end
recipes = Recipe.all.to_a

#----------------------------------------------------------------------------
# Ratings

ratings = []
1000.times do
  rating = Rating.new({
    value: rand(1..5),
    recipe: recipes.sample,
    user: users.sample
    })
  if rating.valid?
    rating.save
  end
end

#----------------------------------------------------------------------------
# Measurements
measurements = []
measurement_items = ["teaspoon", "teaspoons", "Tablespoon", "Tablespoons", "dash", "pinch", "cup", "Pound", "ounces", "Pint", "Quart", "Gallon", "Pints", "Cups", "Quarts", "fluid oz.", "oz.", "bag", "bags", "batch", "batches", "bottle", "bottles", "box", "bunch", "bunches", "bundle", "can", "cans", "clove", "cloves", "cube", "dashes", "drops", "ear", "ears", "envelope", "envelopes", "g", "grams", "handful", "head", "heads", "hearts", "jar", "kg", 'l', "links", "liter", "liters", "loaf", "loaves", "logs", "milliliters", "ounce", "package", "packet", "packets", "piece", "pieces", "pinches", "pounds", "recipes", "rib", "ribs", "rounds", "scoops", "scoop", "sheet", "sheets", "slice", "slices", "splash", "sprig", "sprigs", "stick", "stalks", "stick", "sticks", "strips", "wedges"]

measurement_items.each do |item|
  measurements << Measurement.create!({
        unit: item
    })
end

#----------------------------------------------------------------------------
# Ingredients

ingredients = []
ingredient_items = ["apple", "avocado", "bacon", "banana", "beef", "berry", "carrots", "cauliflower", "cheese", "chicken", "chocolate", "citrus", "coffee", "eggs", "fish", "fruit", "game", "grape", "ham", "lamb", "leafy green", "lemon", "mint", "mushroom", "nut", "orange", "pear", "pepper", "salt", "potato", "poultry", "rice", "rosemary", "sausage", "shellfish", "squash", "thyme", "tofu", "rice", "tomato", "turkey", "vegetable", "watermelon", "yogurt", "milk", "flour", "baking soda", "baking powder", "sugar", "oregano", "tumeric", "ginger", "onion", "yeast"]

ingredient_items.each do |item|
  ingredients << Ingredient.create!({
        name: item
    })
end

#----------------------------------------------------------------------------
# Components

components = []
1000.times do
  components << Component.create!({
    quantity: rand(1..10),
    ingredient: ingredients.sample,
    measurement: measurements.sample,
    recipe: recipes.sample
    })

end