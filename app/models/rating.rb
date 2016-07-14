class Rating < ActiveRecord::Base
  # self.primary_keys = :user_id, :recipe_id
  belongs_to :recipe
  belongs_to :user

  validates :value, presence: true
  validates_uniqueness_of :user_id, :scope => :recipe_id
  validates_inclusion_of :value, :in => 1..5
end
