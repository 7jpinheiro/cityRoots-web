class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :schedule
      t.string :site
      t.string :email
      t.string :address
      t.string :coord
      t.string :transport
      t.boolean :active
      t.integer :timestamp
      t.date :stardate
      t.date :enddate
      t.string :organization
      t.string :price
      t.string :program
      t.integer :event_type_id
      t.integer :city_id
      t.integer :web_user_id

      t.timestamps
    end
  end
end
