class CreateRatingAttractions < ActiveRecord::Migration
  def change
    create_table :rating_attractions do |t|
      t.integer :rating
      t.date :evaluationdate
      t.integer :mobile_user_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
