class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
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
      t.integer :city_id
      t.integer :user_web_id

      t.timestamps
    end
  end
end
