class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string     :quantity, null: false
      t.references :ingredient, index: true
      t.references :measurement, index: true
      t.references :recipe, index: true
      t.timestamps null: false
    end
  end
end
