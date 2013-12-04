class CreateLocalAttractions < ActiveRecord::Migration
  def change
    create_table :local_attractions do |t|
      t.text :details
      t.string :price
      t.integer :attraction_type

      t.timestamps
    end
  end
end
