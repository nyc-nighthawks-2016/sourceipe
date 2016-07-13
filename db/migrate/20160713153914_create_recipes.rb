class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string   :name
      t.string   :difficulty
      t.integer   :prep_time
      t.text     :directions
      t.string   :author
      t.references :user, index: true
      t.references :catergory, index: true

      t.timestamps null: false
    end
  end
end
