class CreatePhotoEvents < ActiveRecord::Migration
  def change
    create_table :photo_events do |t|
      t.string :url
      t.string :name
      t.text :description
      t.string :extension

      t.timestamps
    end
  end
end