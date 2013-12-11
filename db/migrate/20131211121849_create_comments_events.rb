class CreateCommentsEvents < ActiveRecord::Migration
  def change
    create_table :comments_events do |t|
      t.text :comment
      t.date :evalutiondate
      t.integer :mobile_user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
