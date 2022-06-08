class AddCountryNameColumnToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :country_name, :string
  end
end
