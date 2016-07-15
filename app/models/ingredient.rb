class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :recipes, through: :components

  validates :name, presence: true

  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :name, presence: true
  validates :ingredient_exclude


  include PgSearch
  multisearchable :against => [:name]

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  def ingredient_exclude
    unless self.name !~ /^[a-zA-Z\s]*$/
      errors.add(:name, "must contain letters only")
    end
  end

end
