class SplitStickySentencesForActiveProperties < ActiveRecord::Migration[5.2]
  def change
    regex_for_description = /(\w\.)(\w)/

    properties_count = Property.where('(description_ru IS NOT NULL OR description_en IS NOT NULL) AND is_active = true').count
    Property.where('(description_ru IS NOT NULL OR description_en IS NOT NULL) AND is_active = true').each_with_index do |property, index|
      p "Update " + index.to_s + " property of " + properties_count.to_s if index % 100 == 0

      if property.description_ru&.match?(regex_for_description) || property.description_en&.match?(regex_for_description)
        property.description_ru&.gsub!(regex_for_description, '\1 \2')
        property.description_en&.gsub!(regex_for_description, '\1 \2')
        property.save
      end
    end
  end
end
