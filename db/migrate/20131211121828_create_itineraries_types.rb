class CreateItinerariesTypes < ActiveRecord::Migration
  def change
    create_table :itineraries_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
