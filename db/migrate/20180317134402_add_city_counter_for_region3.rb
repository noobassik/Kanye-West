class AddCityCounterForRegion3 < ActiveRecord::Migration[5.1]
  def change
    r_count = Region.count
    Region.all.each_with_index do |r, index|
      if index >= r_count / 2 && index < r_count * 3 / 4
        p "--- Regions cache update for #{index + 1} of #{r_count} in #{Time.now.to_s}" if index % 250 == 0
        Region.update_counters r.id, cities_count: r.cities.length
      end
    end
  end
end
