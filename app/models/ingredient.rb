class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :recipes, through: :components
  validates :name, presence: true

end
