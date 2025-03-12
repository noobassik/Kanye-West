class AddAgenciesCountries < ActiveRecord::Migration[5.2]
  def change
    create_join_table :agencies, :countries do |t|
      t.index :agency_id
      t.index :country_id
    end

    countries_count = Country.count
    Country.visible.each_with_index do |c, index|
      p "--- Country #{index + 1} of #{countries_count}" if index % 10 == 0

      results = ActiveRecord::Base
                    .connection
                    .execute("SELECT \"agencies\".\"id\"
                                        FROM \"agencies\"
                                        INNER JOIN \"properties\"
                                        ON \"agencies\".\"id\" = \"properties\".\"agency_id\"
                                        WHERE \"properties\".\"country_id\" = #{c.id}")

      c.agency_ids = results.map { |r| r['id'] }.uniq
      c.save
    end
  end
end
