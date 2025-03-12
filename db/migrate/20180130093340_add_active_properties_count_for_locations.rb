class AddActivePropertiesCountForLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :active_properties_count, :integer, default: 0, null: false
    add_column :regions, :active_properties_count, :integer, default: 0, null: false
    add_column :countries, :active_properties_count, :integer, default: 0, null: false

    City.reset_column_information

    City.where(coming_soon: false).each do |e|
      City.update_counters e.id, :active_properties_count => e.properties.where("is_active = true AND moderated = true").length
    end

    Region.reset_column_information

    Region.where(coming_soon: false).each do |e|
      Region.update_counters e.id, :active_properties_count => e.properties.where("is_active = true AND moderated = true").length
    end

    Country.reset_column_information

    Country.where(coming_soon: false).each do |e|
      Country.update_counters e.id, :active_properties_count => e.properties.where("is_active = true AND moderated = true").length
    end
  end
end
