class IndiaPart2 < ActiveRecord::Migration[5.1]
  def change
    regions_ids = Country.find(1269750).regions.ids
    regions_ids.each_with_index do |reg, index|
      if index < 4
        cities = Region.find(reg).cities.map(&:clone)
        City.where(region_id: reg, continent: 'AS').delete_all
        p "--- Decompose #{index + 1} * #{cities.count} from #{regions_ids.count} in #{Time.now.to_s}"
        cities.each_with_index do |city|
          city_new = City.new
          city_new.attributes = city.attributes
          city_new.continent = "china_and_india";
          city_new.save
        end
        cities.clear
      end
    end
  end
end
