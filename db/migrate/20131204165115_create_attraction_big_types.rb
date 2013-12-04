class CreateAttractionBigTypes < ActiveRecord::Migration
  def change
    create_table :attraction_big_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
