class AddStudioToPropertyMk2 < ActiveRecord::Migration[5.2]
  def change
    Property.update_all(studio: false)

    properties_count = Property.where('description_ru IS NOT NULL OR description_en IS NOT NULL').count
    Property.where('description_ru IS NOT NULL OR description_en IS NOT NULL').each_with_index do |property, index|
      p "Update " + index.to_s + " property of " + properties_count.to_s if index % 100 == 0

      if (property.description_ru&.match?(/студи/) || property.description_en&.match?(/studio/)) &&
          property.room_count.in?([nil, 0, 1])
        property.update(studio: true)
      end
    end
  end
end
