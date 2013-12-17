class CreateRatingEvents < ActiveRecord::Migration
  def change
    create_table :rating_events do |t|
      t.integer :rating
      t.date :evaluationdate
      t.integer :mobile_user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
