class AddIsActiveToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :is_active, :boolean, default: false
    add_column :regions, :is_active, :boolean, default: false
    add_column :cities, :is_active, :boolean, default: false

    countries_count = Country.count
    Country.all.each_with_index do |country, index|
      p "Country #{index + 1} of #{countries_count}" unless index % 100
      country.update_attribute(:is_active, true) if country.properties_count > 0
    end

    regions_count = Region.count
    Region.all.each_with_index do |region, index|
      p "Region #{index + 1} of #{regions_count}" unless index % 1000
      region.update_attribute(:is_active, true) if region.properties_count > 0
    end

    cities = Set.new
    Property.all.each do |prop|
      if prop.city_id.present? && cities.exclude?(prop.city_id)
        cities << prop.city_id
      end
    end

    cities.each_with_index do |c_id, index|
      city = City.find(c_id)
      p "City #{index + 1} of #{cities.length}" unless index % 10000
      city.update_attribute(:is_active, true) if city.properties_count > 0
      end
    end
end
