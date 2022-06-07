class RenameCitiesLongtitude < ActiveRecord::Migration[6.1]
  def change
    rename_column :cities, :longtitude, :longitude
  end
end
