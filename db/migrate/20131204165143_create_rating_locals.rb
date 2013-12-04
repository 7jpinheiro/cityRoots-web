class CreateRatingLocals < ActiveRecord::Migration
  def change
    create_table :rating_locals do |t|
      t.integer :rating
      t.date :evaluationdate
      t.integer :user_mobile_id
      t.integer :local_id

      t.timestamps
    end
  end
end
