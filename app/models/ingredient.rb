class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :recipes, through: :components
<<<<<<< 4b7d1e24be3387c49252a94c1c9b22ec4cb5638d

  validates :name, presence: true

  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :name, presence: true
  validates :ingredient_exclude
=======
  #validates :name, format: { with: /\A[a-zA-Z]+\z/,
  #  message: "only allows letters" }

  validates :name, presence: true
>>>>>>> fixed ingredient save bug


  include PgSearch
  multisearchable :against => [:name]

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  end

end
