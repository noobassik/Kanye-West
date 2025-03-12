class AddTitleForCountryAndRegion < ActiveRecord::Migration[5.1]
  def change
    sql = ActiveRecord::Base.connection()

    p "--- Add countries title in #{Time.now.to_s}"
    sql.execute("UPDATE countries SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND countries.id = geoname_id LIMIT 1);")
    p "--- Add regions title in #{Time.now.to_s}"
    sql.execute("UPDATE regions SET title_ru = (SELECT alternate_name from alternate_names WHERE iso_language = 'Russian' AND regions.id = geoname_id LIMIT 1);")
    p "--- Finish in #{Time.now.to_s}"
  end
end
