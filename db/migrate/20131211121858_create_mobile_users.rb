class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.string :username
      t.boolean :active
      t.integer :country_id
      t.string :email
      t.string :pass
      t.date :dateofbirth
      t.string :firstname
      t.string :surname
      t.string :gender
      t.integer :language_id
      t.integer :country_id

      t.timestamps
    end
  end
end
