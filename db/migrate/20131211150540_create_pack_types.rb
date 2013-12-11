class CreatePackTypes < ActiveRecord::Migration
  def change
    create_table :pack_types do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.float :price

      t.timestamps
    end
  end
end
