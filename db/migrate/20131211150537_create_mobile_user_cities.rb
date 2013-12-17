class CreateMobileUserCities < ActiveRecord::Migration
  def change
    create_table :mobile_user_cities do |t|
      t.ineteger :city_id
      t.integer :mobile_user_id

      t.timestamps
    end
  end
end
