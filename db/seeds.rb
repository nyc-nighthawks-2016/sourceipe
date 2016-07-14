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
categories.each do |category|
  10.times do
    Recipe.create({
      name: Faker::Lorem.word,
      difficulty: Faker::Lorem.word,
      prep_time: prep_time.sample,
      directions: Faker::Lorem.paragraphs(5),
      author: Faker::Lorem.word,
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