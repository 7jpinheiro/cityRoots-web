class CreateItineraryAttractions < ActiveRecord::Migration
  def change
    create_table :itinerary_attractions do |t|
      t.integer :itinerary_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
