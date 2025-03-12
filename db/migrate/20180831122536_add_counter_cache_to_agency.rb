class AddCounterCacheToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :properties_count, :integer, default: 0, null: false
    add_column :agencies, :active_properties_count, :integer, default: 0, null: false
    add_column :agencies, :active_and_moderated_properties_count, :integer, default: 0, null: false

    add_index :agencies, :properties_count

    agencies_count = Agency.all.count
    Agency.all.each_with_index do |a, index|
      p "---Agency #{index+1} of #{agencies_count}" if index % 10 == 0
      a.update_counter_cache
    end
  end
end
