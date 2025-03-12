class RemoveUselessModels < ActiveRecord::Migration[5.2]
  def change
    drop_table :house_types
    drop_table :land_types
    drop_table :adjoining_territories
    drop_table :house_location_types
    drop_table :near_types
    drop_table :ownership_types
    drop_table :parking_types
    drop_table :pond_types
    drop_table :recoupment_types
    drop_table :house_attributes
    drop_table :land_attributes

    remove_column :properties, :near_type_id
    remove_column :commercial_property_attributes, :recoupment_type_id
    remove_column :commercial_property_attributes, :ownership_type_id
    remove_column :commercial_property_attributes, :parking_type_id
  end
end
