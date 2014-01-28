class CreateAttractionTranslations < ActiveRecord::Migration
  def change
    create_table :attraction_translations do |t|
      t.string :name
      t.string :schedule
      t.string :language
      t.string :description
      t.string :transport

      t.timestamps
    end
  end
end
