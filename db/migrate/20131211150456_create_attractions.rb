class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.string :schedule
      t.string :site
      t.string :email
      t.string :address
      t.string :coord
      t.string :transport
      t.boolean :reference_point
      t.boolean :active
      t.integer :timestamp
      t.text :details
      t.string :price
      t.integer :attraction_type_id
      t.integer :city_id
      t.integer :web_user_id

      t.timestamps
    end
  end
end
