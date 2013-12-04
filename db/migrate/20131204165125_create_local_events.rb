class CreateLocalEvents < ActiveRecord::Migration
  def change
    create_table :local_events do |t|
      t.date :stardate
      t.date :enddate
      t.string :organization
      t.string :price
      t.string :program
      t.integer :event_type_id

      t.timestamps
    end
  end
end
