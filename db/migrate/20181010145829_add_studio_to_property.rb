class AddStudioToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :studio, :boolean, default: false

    properties_count = Property.where('description_ru IS NOT NULL OR description_en IS NOT NULL').count
    Property.where('description_ru IS NOT NULL OR description_en IS NOT NULL').each_with_index do |property, index|
      p "Update " + index.to_s + " property of " + properties_count.to_s if index % 100 == 0

      if property.description_ru&.match?(/студи/) || property.description_en&.match?(/studio/)
        property.update(studio: true)
      end
    end
  end
end
