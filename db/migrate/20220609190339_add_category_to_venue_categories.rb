class AddCategoryToVenueCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :venue_categories, :category, null: false, foreign_key: true
  end
end
