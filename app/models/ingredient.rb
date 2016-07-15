class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :recipes, through: :components

  validates :name, presence: true

  include PgSearch
  multisearchable :against => [:name]

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

end
