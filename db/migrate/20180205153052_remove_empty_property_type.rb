class RemoveEmptyPropertyType < ActiveRecord::Migration[5.1]
  def change
    Property.where(property_type_id: 17).each do |property|
      property.update_column(:property_type_id, 15)
    end

    PropertyType.find(17).destroy
  end
end
