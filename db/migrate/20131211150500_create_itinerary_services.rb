class CreateItineraryServices < ActiveRecord::Migration
  def change
    create_table :itinerary_services do |t|
      t.integer :itinerary_id
      t.integer :service_id

      t.timestamps
    end
  end
end
