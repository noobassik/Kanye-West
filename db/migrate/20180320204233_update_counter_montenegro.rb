class UpdateCounterMontenegro < ActiveRecord::Migration[5.1]
  def change
    c_montenegro = Country.find(3194884);
    Country.reset_counters c_montenegro.id, :properties_count

    r_count = c_montenegro.regions.count
    c_montenegro.regions.each_with_index do |r, index|
        p "--- Regions cache update for #{index + 1} of #{r_count} in #{Time.now.to_s}" if index % 10 == 0
        Region.reset_counters r.id, :properties_count
    end

    c_count = c_montenegro.cities.count
    c_montenegro.cities.each_with_index do |c, index|
      p "--- Cities cache update for #{index + 1} of #{c_count} in #{Time.now.to_s}" if index % 10 == 0
      City.reset_counters c.id, :properties_count
    end
  end
end
