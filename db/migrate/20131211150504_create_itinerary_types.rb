class CreateItineraryTypes < ActiveRecord::Migration
  def change
    create_table :itinerary_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
