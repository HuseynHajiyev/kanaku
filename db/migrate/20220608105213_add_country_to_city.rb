class AddCountryToCity < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :country, :string
  end
end
