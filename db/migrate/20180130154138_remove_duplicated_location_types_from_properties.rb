class RemoveDuplicatedLocationTypesFromProperties < ActiveRecord::Migration[5.1]
  def change
    LocationType.all.each do |lt|
      p "current location type is #{lt.title_en}"
      properties = lt.properties.distinct.to_a
      lt.properties.delete_all
      lt.properties << properties
      lt.save
    end
  end
end
