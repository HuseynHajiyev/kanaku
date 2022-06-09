class RemoveCategoriesIdFromVenueCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :venue_categories, :categories_id
  end
end
