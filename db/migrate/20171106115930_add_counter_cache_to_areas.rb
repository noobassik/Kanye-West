class AddCounterCacheToAreas < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :properties_count, :integer, default: 0


    # c_count = Country.all.count
    # Country.reset_column_information
    # Country.all.each_with_index do |c, index|
    #   p "--- Counties cache update for #{index + 1} of #{c_count}" if index % 25 == 0
    #   Country.update_counters c.id, properties_count: c.properties.length
    # end


    add_column :regions, :properties_count, :integer, default: 0

    # r_count = Region.all.count
    # Region.reset_column_information
    # Region.all.each_with_index do |r, index|
    #   p "--- Regions cache update for #{index + 1} of #{r_count}" if index % 250 == 0
    #   Region.update_counters r.id, properties_count: r.properties.length
    # end


    add_column :cities, :properties_count, :integer, default: 0

   #  City.reset_column_information
   #  cities = Set.new
   #  Property.all.each do |prop|
   #    if prop.city_id.present? && cities.exclude?(prop.city_id)
   #      cities << prop.city_id
   #    end
   #  end
   #
   #  cities.each_with_index do |c_id, index|
   #      p "--- Cities cache update for #{index + 1} of #{cities.length}" if index % 2500 == 0
   #      c = City.find(c_id)
   #      City.update_counters c_id, properties_count: c.properties.length if c.properties.length > 0
   # end
  end
end
