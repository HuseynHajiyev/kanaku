class ChangeCountryName < ActiveRecord::Migration[6.1]
  def change
    change_table :cities do |t|
      t.rename :country_name, :name_country
    end
  end
end
