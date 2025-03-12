class AddCityCounterForRegion < ActiveRecord::Migration[5.1]
  def change
    add_column :regions, :cities_count, :integer, default: 0
    Region.reset_column_information

    r_count = Region.count
    Region.all.each_with_index do |r, index|
      if index < r_count / 4
        p "--- Regions cache update for #{index + 1} of #{r_count} in #{Time.now.to_s}" if index % 250 == 0
        Region.update_counters r.id, cities_count: r.cities.length
      end
    end
  end
end
