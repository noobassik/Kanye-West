class AddPopularForLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :is_popular, :boolean, default: false
    add_column :regions, :is_popular, :boolean, default: false
    add_column :cities, :is_popular, :boolean, default: false
  end
end
