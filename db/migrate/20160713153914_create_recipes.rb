class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string   :name, null: false
      t.selector   :difficulty, null: false
      t.integer  :prep_time, null: false
      t.text     :directions, null: false
      t.string   :author, null: false
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
