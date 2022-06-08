class RenameCitiesDescritpion < ActiveRecord::Migration[6.1]
  def change
    rename_column :cities, :descritpion, :description
  end
end
