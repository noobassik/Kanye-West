class RemoveBuildingStages < ActiveRecord::Migration[5.2]
  def change
    drop_table :building_stages

    remove_index :noncommercial_property_attributes, :building_stage_id
    remove_column :noncommercial_property_attributes, :building_stage_id
  end
end
