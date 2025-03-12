class AddDescriptionToProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :description_ru, :string
    add_column :properties, :description_en, :string

    count_property = Property.count
    Property.all.each_with_index do |property, index|
      p "Property #{index + 1} of #{count_property}" if index % 100 == 0

      if property.description_two_ru.present?
        property.update_column(:description_ru, property.description_two_ru)
      end
      if property.description_two_en.present?
        property.update_column(:description_en, property.description_two_en)
      end

      if property.description_three_ru.present?
        property.update_column(:description_ru, property.description_three_ru)
      end
      if property.description_three_en.present?
        property.update_column(:description_en, property.description_three_en)
      end
    end
  end
end
