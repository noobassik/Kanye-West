class RemovePropertiesWithoutPictures < ActiveRecord::Migration[5.1]
  def change
    destroyed_properties = Property.left_outer_joins(:pictures).where( pictures: { id: nil } )
    destroyed_properties_count = destroyed_properties.count
    destroyed_properties.each_with_index do |p, index|
      p.destroy
      p "#{index} properties of #{destroyed_properties_count} was destroyed" if index % 20 == 0
    end
  end
end
