class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.string :username
      t.boolean :active
      t.integer :country_id

      t.timestamps
    end
  end
end
