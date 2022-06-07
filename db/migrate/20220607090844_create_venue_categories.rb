class CreateVenueCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :venue_categories do |t|
      t.references :categories, null: false, foreign_key: true
      t.references :venues, null: false, foreign_key: true

      t.timestamps
    end
  end
end
