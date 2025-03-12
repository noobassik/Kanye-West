class AddPropertiesCountIndexToLocations < ActiveRecord::Migration[5.1]
  def change
    add_index :cities, :properties_count
    add_index :countries, :properties_count
    add_index :regions, :properties_count
  end
end
