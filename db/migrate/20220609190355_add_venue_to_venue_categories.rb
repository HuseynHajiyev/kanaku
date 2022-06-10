class AddVenueToVenueCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :venue_categories, :venue, null: false, foreign_key: true
  end
end
