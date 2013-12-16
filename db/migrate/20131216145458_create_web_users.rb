class CreateWebUsers < ActiveRecord::Migration
  def change
    create_table :web_users do |t|
      t.string :name
      t.string :enterprisename
      t.string :obs
      t.integer :nif
      t.text :address
      t.boolean :active
      t.integer :web_user_type_id
      t.integer :city_id

      t.timestamps
    end
  end
end
