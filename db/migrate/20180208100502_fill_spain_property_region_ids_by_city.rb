class FillSpainPropertyRegionIdsByCity < ActiveRecord::Migration[5.1]
  def change

    sql = ActiveRecord::Base.connection()
    #Аликанте
    sql.execute("UPDATE properties SET region_id = 2593113 WHERE city_id = 2521978;")
    update_values = Set.new
    updated_count = 0

    properties = Property.where('NOT city_id IS NULL AND region_id IS NULL AND (country_id = 2510769)')
    prop_count = properties.count
    properties.each_with_index do |prop, index|
      p "--- Add cities #{index + 1} of #{prop_count} in #{Time.now.to_s}" if index % 100 == 0
      update_values << prop.id
      if updated_count == 1000
        sql.execute("UPDATE properties SET region_id = (SELECT region_id FROM cities WHERE continent = 'EU' AND cities.id = properties.city_id) WHERE id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
        updated_count = 0
        update_values.clear
      end
      updated_count += 1
    end

    if update_values.count > 0
      sql.execute("UPDATE properties SET region_id = (SELECT region_id FROM cities WHERE continent = 'EU' AND cities.id = properties.city_id) WHERE id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
      update_values.clear
    end
    p "--- Finish in #{Time.now.to_s}"
  end
end
