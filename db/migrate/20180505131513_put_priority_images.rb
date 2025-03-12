class PutPriorityImages < ActiveRecord::Migration[5.1]
  def change
    property = Property.moderated
    prop_count = property.count
    property.each_with_index  do |prop, index|
      p "--- Update priority for #{index + 1} of #{prop_count} in #{Time.now.to_s}" if index % 100 == 0
      prop.pictures.each do |pic|
        pic.priority = prop.pictures.maximum(:priority) + 1
        pic.save
      end
    end
  end
end
