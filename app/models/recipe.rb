class Recipe < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :components
  has_many :ratings
  has_many :ingredients, through: :components
  has_many :measurements, through: :components

  validates :name, :difficulty, :prep_time, :directions, :author, presence: true
end