class AddRussianTitleForLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :title_ru, :string

    add_column :regions, :title_ru, :string

    add_column :cities, :title_ru, :string
    sql = ActiveRecord::Base.connection()

    p "--- Add countries title in #{Time.now.to_s}"
    #sql.execute("UPDATE countries SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND countries.id = geoname_id LIMIT 1);")
    p "--- Add regions title in #{Time.now.to_s}"
    #sql.execute("UPDATE regions SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND regions.id = geoname_id LIMIT 1);")
    p "--- Add cities title in #{Time.now.to_s}"

    popular_countries = [2510769, 458258, 6252001, 2635167, 3077311]
    alter_names_ru = Set.new
    used_ids  = Set.new
    cities = Set.new
    popular_countries.each do |pop_country|
      country = Country.find(pop_country)
      country.regions&.each do |reg|
        cities.merge(reg.cities&.ids.map(&:to_s))
      end
      cities.merge(country.cities&.ids.map(&:to_s))
    end

    AlternateName.where(iso_language: 'Russian').each do |an|
      if cities.include?(an.geoname_id.to_s)
        alter_names_ru << an.geoname_id.to_s
      end
    end

    update_values = Set.new
    updated_count = 0
    p alter_names_ru.count

    alter_names_ru.each_with_index do |alter_name, index|
      p "--- Add title #{index + 1} of #{alter_names_ru.count} in #{Time.now.to_s}" if index % 1000 == 0
      if used_ids.exclude?(alter_name)
        update_values << alter_name
        if updated_count == 1000
          sql.execute("UPDATE cities SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND cities.id = geoname_id LIMIT 1) WHERE id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
          updated_count = 0
          update_values.clear
        end
        updated_count += 1
        used_ids << alter_name
      end
    end

    if update_values.count > 0
      sql.execute("UPDATE cities SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND cities.id = geoname_id LIMIT 1) WHERE id IN (#{update_values.to_a.to_s.tr('[\"]','')});")
      update_values.clear
    end
    p "--- Finish in #{Time.now.to_s}"
  end
end

