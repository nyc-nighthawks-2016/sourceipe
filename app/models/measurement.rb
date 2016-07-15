class Measurement < ActiveRecord::Base
  has_many :components
  has_many :recipes, through: :components

  validates :unit, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
