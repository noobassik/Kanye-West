class RenamePropertyFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :land_attributes, :buildings_exist, :has_buildings
  end
end
