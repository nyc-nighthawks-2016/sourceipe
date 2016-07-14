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

  include PgSearch
  multisearchable :against => [:name]

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  def average_rating
    rating = self.ratings.reduce(0) {|sum, rating| sum + rating.value} / (self.ratings.count).to_f
    rating.round(2)
  end

  def minimum_votes
    100
  end

  def weighted_ratings
    v = self.ratings.length
    (v/(v + minimum_votes)) * self.average_rating + (minimum_votes / (v + minimum_votes)) * total_votes
  end
end
