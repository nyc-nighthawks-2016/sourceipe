class Component < ActiveRecord::Base
  belongs_to :measurement
  belongs_to :ingredient
  belongs_to :recipe

  validates :quantity, presence: true
  validates :ingredient, presence: true

end
