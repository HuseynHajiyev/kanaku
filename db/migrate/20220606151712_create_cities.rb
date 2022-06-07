class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :descritpion
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
