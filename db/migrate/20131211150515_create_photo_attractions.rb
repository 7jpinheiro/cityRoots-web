class CreatePhotoAttractions < ActiveRecord::Migration
  def change
    create_table :photo_attractions do |t|
      t.string :url
      t.string :name
      t.text :description
      t.string :extension

      t.timestamps
    end
  end
end