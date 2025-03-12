class UpdatePropertiesCounterForLocations < ActiveRecord::Migration[5.1]
  def change
    countries_count = Country.where('NOT active_properties_count = properties_count').count
    Country.where('NOT active_properties_count = properties_count').each_with_index do |c, index|
      p "---Countries #{index+1} of #{countries_count}" if index % 10 == 0
      c.update_counter_cache
    end

    regions_count = Region.where('NOT active_properties_count = properties_count').count
    Region.where('NOT active_properties_count = properties_count').each_with_index do |r, index|
      p "---Regions #{index+1} of #{regions_count}" if index % 10 == 0
      r.update_counter_cache
    end

    cities_count = City.where('NOT active_properties_count = properties_count').count
    City.where('NOT active_properties_count = properties_count').each_with_index do |c, index|
      p "---Cities #{index+1} of #{cities_count}" if index % 10 == 0
      c.update_counter_cache
    end
  end
end
