class AddComingSoonToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :coming_soon, :boolean, default: true
    add_column :regions, :coming_soon, :boolean, default: true
    add_column :cities, :coming_soon, :boolean, default: true
  end
end
