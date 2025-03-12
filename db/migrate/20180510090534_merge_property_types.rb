class MergePropertyTypes < ActiveRecord::Migration[5.1]
  def change
    property_type_ids = [[10, 4], [2, 11], [3, 7]]

    property_type_ids.each do |ptid|
      original = PropertyType.find(ptid[0])
      removable = PropertyType.find(ptid[1])

      removable.properties.update_all(property_type_id: original.id)
      removable.destroy
    end

  end
end
