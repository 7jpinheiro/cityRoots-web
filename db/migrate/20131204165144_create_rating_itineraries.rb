class CreateRatingItineraries < ActiveRecord::Migration
  def change
    create_table :rating_itineraries do |t|
      t.integer :rating
      t.date :evaluationdate
      t.integer :user_mobile_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
