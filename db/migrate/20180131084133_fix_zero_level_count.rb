class FixZeroLevelCount < ActiveRecord::Migration[5.1]
  def change
    Property.joins(:noncommercial_property_attribute)
        .where("noncommercial_property_attributes.level_count = 0")
        .map(&:noncommercial_property_attribute).each do |attr|
      attr.update_column(:level_count, nil)
    end
  end
end
