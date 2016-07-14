class Rating < ActiveRecord::Base
  # self.primary_keys = :user_id, :recipe_id
  belongs_to :recipe
  belongs_to :user

  validates :value, presence: true
  validates_uniqueness_of :user_id, :scope => :recipe_id
end
