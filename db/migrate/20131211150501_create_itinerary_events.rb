class CreateItineraryEvents < ActiveRecord::Migration
  def change
    create_table :itinerary_events do |t|
      t.integer :itinerary_id
      t.integer :event_id

      t.timestamps
    end
  end
end
