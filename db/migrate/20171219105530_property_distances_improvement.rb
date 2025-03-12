class PropertyDistancesImprovement < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :to_ski_lift, :integer
    add_column :properties, :to_ski_lift_unit, :integer
    add_column :properties, :to_sea, :integer
    add_column :properties, :to_sea_unit, :integer
    add_column :properties, :to_metro_station, :integer
    add_column :properties, :to_metro_station_unit, :integer
    add_column :properties, :to_state_border, :integer
    add_column :properties, :to_state_border_unit, :integer

    rename_column :properties, :to_health_facilities, :to_medical_facilities
    rename_column :properties, :to_health_facilities_unit, :to_medical_facilities_unit
    rename_column :properties, :to_station, :to_railroad_station
    rename_column :properties, :to_station_unit, :to_railroad_station_unit
    rename_column :properties, :to_nearest_major_settlement, :to_nearest_big_city
    rename_column :properties, :to_nearest_major_settlement_unit, :to_nearest_big_city_unit

    remove_column :properties, :to_nearest_settlement
    remove_column :properties, :to_nearest_settlement_unit
  end
end
