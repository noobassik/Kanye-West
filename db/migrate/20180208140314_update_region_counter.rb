class UpdateRegionCounter < ActiveRecord::Migration[5.1]
  def change
    r_count = Region.all.count
    Region.reset_column_information
    Region.all.each_with_index do |r, index|
      p "--- Regions cache update for #{index + 1} of #{r_count}" if index % 250 == 0
      Region.update_counters r.id, properties_count: r.properties.length
    end
  end
end
