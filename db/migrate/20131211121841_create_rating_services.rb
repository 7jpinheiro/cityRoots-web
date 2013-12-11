class CreateRatingServices < ActiveRecord::Migration
  def change
    create_table :rating_services do |t|
      t.integer :rating
      t.date :evaluationdate
      t.integer :mobile_user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
