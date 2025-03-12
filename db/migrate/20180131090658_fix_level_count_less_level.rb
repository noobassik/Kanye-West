class FixLevelCountLessLevel < ActiveRecord::Migration[5.1]
  def change
    Property.joins(:noncommercial_property_attribute)
        .where("noncommercial_property_attributes.level_count IS NOT NULL
                  AND noncommercial_property_attributes.level IS NOT NULL
                  AND noncommercial_property_attributes.level_count < noncommercial_property_attributes.level")
        .map(&:noncommercial_property_attribute).each do |attr|
      attr.update_columns(level: nil, level_count: nil)
    end
  end
end
