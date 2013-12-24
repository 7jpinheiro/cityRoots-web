class CreateWebUserTypes < ActiveRecord::Migration
  def change
    create_table :web_user_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
