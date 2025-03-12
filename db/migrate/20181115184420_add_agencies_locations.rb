class AddAgenciesLocations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :agencies, :regions do |t|
      t.index :agency_id
      t.index :region_id
    end

    create_join_table :agencies, :cities do |t|
      t.index :agency_id
      t.index :city_id
    end


    regions_count = Region.visible.count
    Region.visible.each_with_index do |c, index|
      p "--- Region #{index + 1} of #{regions_count}" if index % 10 == 0

      results = ActiveRecord::Base
                    .connection
                    .execute("SELECT \"agencies\".\"id\"
                                      FROM \"agencies\"
                                      INNER JOIN \"properties\"
                                      ON \"agencies\".\"id\" = \"properties\".\"agency_id\"
                                      WHERE \"properties\".\"region_id\" = #{c.id}")

      c.agencies.clear
      c.agency_ids = results.map { |r| r['id'] }.uniq
      c.save
    end


    cities_count = City.visible.count
    City.visible.each_with_index do |c, index|
      p "--- City #{index + 1} of #{cities_count}" if index % 100 == 0

      results = ActiveRecord::Base
                    .connection
                    .execute("SELECT \"agencies\".\"id\"
                                      FROM \"agencies\"
                                      INNER JOIN \"properties\"
                                      ON \"agencies\".\"id\" = \"properties\".\"agency_id\"
                                      WHERE \"properties\".\"city_id\" = #{c.id}")

      c.agencies.clear
      c.agency_ids = results.map { |r| r['id'] }.uniq
      c.save
    end
  end
end
