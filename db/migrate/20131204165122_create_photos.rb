class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :name
      t.text :description
      t.string :extension

      t.timestamps
    end
  end
end
