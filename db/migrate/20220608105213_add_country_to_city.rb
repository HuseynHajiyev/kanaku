class AddCountryToCity < ActiveRecord::Migration[6.1]
  def change
    add_column :city, :country, :string
  end
end
