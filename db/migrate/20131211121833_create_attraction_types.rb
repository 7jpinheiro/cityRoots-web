class CreateAttractionTypes < ActiveRecord::Migration
  def change
    create_table :attraction_types do |t|
      t.string :name
      t.text :description
      t.integer :attraction_big_types_id

      t.timestamps
    end
  end
end
