class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer    :value, null: false
      t.references :recipe, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
