class CreateWebUsersPacks < ActiveRecord::Migration
  def change
    create_table :web_users_packs do |t|
      t.date :subscriptiondate
      t.date :validity
      t.string :obs
      t.boolean :active
      t.integer :pack_type_id
      t.integer :web_user_id

      t.timestamps
    end
  end
end
