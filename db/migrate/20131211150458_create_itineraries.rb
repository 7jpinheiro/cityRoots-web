class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name
      t.text :description
      t.integer :itinerary_type_id

      t.timestamps
    end
  end
end
