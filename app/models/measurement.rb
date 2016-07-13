class Measurement < ActiveRecord::Base
  has_many :components
  has_many :recipes, through: :components

  validates :unit, presence: true
end
