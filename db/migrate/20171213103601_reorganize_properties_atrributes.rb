class ReorganizePropertiesAtrributes < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :building_year, :date
    add_column :properties, :last_repair, :date
    add_column :properties, :with_elevator, :boolean, default: false
    add_column :properties, :with_parking, :boolean, default: false
    add_column :properties, :room_count, :integer
    add_column :properties, :price_on_request, :boolean, default: false
    add_column :properties, :off_plan, :boolean, default: false
    add_column :properties, :resale, :boolean, default: false

    remove_column :commercial_property_attributes, :building_year
    remove_column :commercial_property_attributes, :last_repair
    remove_column :commercial_property_attributes, :room_count_id

    remove_column :noncommercial_property_attributes, :building_year
    remove_column :noncommercial_property_attributes, :room_count_id
    rename_column :noncommercial_property_attributes, :floor, :level
    rename_column :noncommercial_property_attributes, :count_floors, :level_count

    add_column :noncommercial_property_attributes, :bathroom_count, :integer
    add_column :noncommercial_property_attributes, :bedroom_count,  :integer

    remove_column :apartment_attributes, :with_elevator
    remove_column :apartment_attributes, :count_bathrooms
    remove_column :apartment_attributes, :count_bedrooms

    remove_column :house_attributes, :with_parking
    rename_column :house_attributes, :noncommercial_property_id, :property_id

    rename_column :apartment_attributes, :noncommercial_property_id, :property_id

    add_column :land_attributes, :agricultural, :boolean
    add_column :land_attributes, :for_residential_building, :boolean
    rename_column :land_attributes, :for_building, :for_commercial_building

    remove_column :apartment_attributes, :space
    remove_column :apartment_attributes, :space_unit
    remove_column :house_attributes, :area_space
    remove_column :house_attributes, :area_space_unit
    remove_column :land_attributes, :area_space
    remove_column :land_attributes, :area_space_unit

    add_column :properties, :area, :float
    add_column :properties, :area_unit, :integer
    add_column :properties, :plot_area, :float
    add_column :properties, :plot_area_unit, :integer
  end
end
