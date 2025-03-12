class FillAllPropertyRegionByCityIds < ActiveRecord::Migration[5.1]
  def change
    sql = ActiveRecord::Base.connection()
    update_values = Set.new
    updated_count = 0
    popular_countries = [458258, 6252001, 2635167, 3077311]

    properties = Property.where('NOT city_id IS NULL AND region_id IS NULL AND country_id IN(?)', popular_countries)
    prop_count = properties.count
    properties.each_with_index do |prop, index|
      p "--- Add cities #{index + 1} of #{prop_count} in #{Time.now.to_s}" if index % 100 == 0
      update_values << prop.id
      if updated_count == 1000
        sql.execute("UPDATE properties SET region_id = (SELECT region_id FROM cities WHERE cities.id = properties.city_id) WHERE id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
        updated_count = 0
        update_values.clear
      end
      updated_count += 1
    end

    if update_values.count > 0
      sql.execute("UPDATE properties SET region_id = (SELECT region_id FROM cities WHERE cities.id = properties.city_id) WHERE id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
      update_values.clear
    end
    p "--- Finish in #{Time.now.to_s}"

    r_count = Region.all.count
    Region.reset_column_information
    Region.all.each_with_index do |r, index|
      p "--- Regions cache update for #{index + 1} of #{r_count}" if index % 250 == 0
      Region.update_counters r.id, properties_count: r.properties.length
    end
  end
end
