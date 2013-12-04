class CreateCommentsItineraries < ActiveRecord::Migration
  def change
    create_table :comments_itineraries do |t|
      t.text :comment
      t.date :evalutiondate
      t.integer :user_mobile_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
