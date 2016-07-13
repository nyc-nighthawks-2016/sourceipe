class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :ingredients
  has_many :ratings


end
