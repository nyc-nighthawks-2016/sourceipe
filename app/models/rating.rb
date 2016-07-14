class Rating < ActiveRecord::Base
  belongs_to :recipe, uniqueness: true, scope: :user
  belongs_to :user

  validates :value, presence: true

end
