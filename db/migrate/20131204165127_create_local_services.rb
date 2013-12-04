class CreateLocalServices < ActiveRecord::Migration
  def change
    create_table :local_services do |t|
      t.integer :capacity
      t.text :details
      t.integer :service_type_id

      t.timestamps
    end
  end
end
