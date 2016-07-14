class Recipe < ActiveRecord::Base
  # self.primary_keys = :user_id, :category_id
  belongs_to :category
  belongs_to :user
  has_many :components
  has_many :ratings
  has_many :ingredients, through: :components
  has_many :measurements, through: :components

  validates :name, :difficulty, :prep_time, :directions, :author, presence: true
  validates_uniqueness_of :user_id, :scope => :category_id
end
