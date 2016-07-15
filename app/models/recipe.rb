class Recipe < ActiveRecord::Base
  # self.primary_keys = :user_id, :category_id
  belongs_to :category
  belongs_to :user
  has_many :components
  has_many :ratings
  has_many :ingredients, through: :components
  has_many :measurements, through: :components

  validates :name, :difficulty, :directions, :author, presence: true
  validates_inclusion_of :prep_time, :in => 1..1000
  validates_uniqueness_of :user_id, :scope => :category_id

  include PgSearch
  multisearchable :against => [:name]

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  def average_rating
    if self.ratings.count > 0
      rating = self.ratings.reduce(0) {|sum, rating| sum + rating.value} / (self.ratings.count)
    else
      return 0
    end
    #rating.round(2)
  end

  def weighted_ratings
    v = self.ratings.length
    m = vote_minimum
    c = self.category.vote_mean
    weighted = (v / (v + m) ) * self.average_rating + (m / (v + m) ) * c
  end

  def converted_rating
    return ((self.weighted_ratings * 5) / 100).round(2)
  end

    def vote_minimum
      self.category.vote_count * 0.2
    end
end
