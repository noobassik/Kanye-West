class UpdatePropertiesCountForLocations < ActiveRecord::Migration[5.1]
  def change
    countries_count = Country.joins(:properties).distinct.count
    Country.joins(:properties).distinct.each_with_index do |c, index|
      p "---Countries #{index+1} of #{countries_count}" if index % 10 == 0
      c.update_counter_cache
    end

    regions_count = Region.joins(:properties).distinct.count
    Region.joins(:properties).distinct.each_with_index do |r, index|
      p "---Regions #{index+1} of #{regions_count}" if index % 10 == 0
      r.update_counter_cache
    end

    cities_count = City.joins(:properties).distinct.count
    City.joins(:properties).distinct.each_with_index do |c, index|
      p "---Cities #{index+1} of #{cities_count}" if index % 10 == 0
      c.update_counter_cache
    end
  end
end
