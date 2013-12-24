class CreateEventTranslations < ActiveRecord::Migration
  def change
    create_table :event_translations do |t|
      t.string :name
      t.string :schedule
      t.string :language
      t.text :description
      t.string :transport

      t.timestamps
    end
  end
end
