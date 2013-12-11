class CreateCommentItineraries < ActiveRecord::Migration
  def change
    create_table :comment_itineraries do |t|
      t.text :comment
      t.date :evalutiondate
      t.integer :mobile_user_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
