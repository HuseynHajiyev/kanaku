class CreateJourneyVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :journey_venues do |t|
      t.references :venue, null: false, foreign_key: true
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
