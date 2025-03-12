class AddTitleEuPart2 < ActiveRecord::Migration[5.1]
  def change
    sql = ActiveRecord::Base.connection()
    alter_names_ru = Set.new
    used_ids  = Set.new
    cities_EU = Set.new

    #Проверка на Вентспилс и Елгава
    region_ventspils =  Region.find(454311)
    region_jelgava =  Region.find(459281)
    region_ventspils.country_id = 458258
    region_jelgava.country_id = 458258
    region_ventspils.save
    region_jelgava.save

    sql.execute("UPDATE cities SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND cities.id = geoname_id LIMIT 1) WHERE continent = 'EU' AND (region_id = 454311 OR region_id = 459281);")

    cities_EU.merge(City.where("continent = 'EU' AND title_ru IS NULL").ids.map(&:to_s))

    AlternateName.where(iso_language: 'Russian').each do |an|
      if cities_EU.include?(an.geoname_id.to_s)
        alter_names_ru << an.geoname_id.to_s
      end
    end

    update_values = Set.new
    updated_count = 0
    p alter_names_ru.count

    alter_names_ru.each_with_index do |alter_name, index|
      if index >= alter_names_ru.count/2
        p "--- Add title #{index + 1} of #{alter_names_ru.count} in #{Time.now.to_s}" if index % 1000 == 0
        if used_ids.exclude?(alter_name)
          update_values << alter_name
          if updated_count == 1000
            sql.execute("UPDATE cities SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND cities.id = geoname_id LIMIT 1) WHERE continent = 'EU' AND id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
            updated_count = 0
            update_values.clear
          end
          updated_count += 1
        end
      end
    end

    if update_values.count > 0
      sql.execute("UPDATE cities SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND cities.id = geoname_id LIMIT 1) WHERE continent = 'EU' AND id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
      update_values.clear
    end
    p "--- Finish in #{Time.now.to_s}"
  end
end
