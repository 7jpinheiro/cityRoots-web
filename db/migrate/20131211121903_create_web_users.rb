class CreateWebUsers < ActiveRecord::Migration
  def change
    create_table :web_users do |t|
      t.string :name
      t.string :enterprisename
      t.string :nif
      t.string :address
      t.string :email
      t.string :username
      t.string :pass
      t.boolean :active
      t.integer :wen_user_type_id
      t.integer :city_id

      t.timestamps
    end
  end
end
