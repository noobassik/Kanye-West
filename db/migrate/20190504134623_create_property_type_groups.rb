class CreatePropertyTypeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :property_type_groups do |t|
      t.string :title_ru
      t.string :title_en
      t.belongs_to :property_supertype
    end

    add_reference :property_types, :property_type_group

    # Жилая
    apartments = PropertyTypeGroup.create!(title_ru: "Апартаменты, квартиры, пентхаусы", title_en: "Apartments, penthouses", property_supertype_id: 2)
    houses = PropertyTypeGroup.create!(title_ru: "Дома, виллы, шале", title_en: "Houses, villas, chalets", property_supertype_id: 2)
    bungalow = PropertyTypeGroup.create!(title_ru: "Бунгало", title_en: "Bungalow", property_supertype_id: 2)
    townhouses = PropertyTypeGroup.create!(title_ru: "Таунхаусы", title_en: "Townhouses", property_supertype_id: 2)
    elite = PropertyTypeGroup.create!(title_ru: "Элитная недвижимость", title_en: "Mansions, castles, patrimonies", property_supertype_id: 2)
    other = PropertyTypeGroup.create!(title_ru: "Другое", title_en: "Other", property_supertype_id: 2)

    PropertyType.where(id: [3, 22, 23]).update_all(property_type_group_id: apartments.id)
    PropertyType.where(id: [1, 24, 25]).update_all(property_type_group_id: houses.id)
    PropertyType.find(19).update(property_type_group_id: bungalow.id)
    PropertyType.find(8).update(property_type_group_id: townhouses.id)
    PropertyType.where(id: [5, 26]).update_all(property_type_group_id: elite.id)
    PropertyType.find(15).update(property_type_group_id: other.id)

    # Коммерческая
    residential = PropertyTypeGroup.create!(title_ru: "Жилая доходная недвижимость", title_en: "Residential/rentals", property_supertype_id: 1)
    industrial = PropertyTypeGroup.create!(title_ru: "Индустриальная недвижимость", title_en: "Industrial real estate", property_supertype_id: 1)
    retail = PropertyTypeGroup.create!(title_ru: "Торговая недвижимость", title_en: "Retail property", property_supertype_id: 1)
    office = PropertyTypeGroup.create!(title_ru: "Офисная недвижимость", title_en: "Office property", property_supertype_id: 1)
    investment = PropertyTypeGroup.create!(title_ru: "Инвестиционные проекты", title_en: "Investment projects", property_supertype_id: 1)
    other_commercial = PropertyTypeGroup.create!(title_ru: "Другая коммерческая недвижимость", title_en: "Other commercial property", property_supertype_id: 1)

    PropertyType.find(16).update(property_type_group_id: residential.id)
    PropertyType.where(id: [18, 13]).update_all(property_type_group_id: industrial.id)
    PropertyType.where(id: [9, 28, 12, 34, 36]).update_all(property_type_group_id: retail.id)
    PropertyType.where(id: [14, 27, 33]).update_all(property_type_group_id: office.id)
    PropertyType.where(id: [6, 29, 30, 31, 32, 35]).update_all(property_type_group_id: investment.id)
    PropertyType.find(2).update(property_type_group_id: other_commercial.id,
                                title_ru: "Другая коммерческая недвижимость",
                                title_en: "Other commercial property")

    # Земля
    land = PropertyTypeGroup.create!(title_ru: "Земельные участки", title_en: "Land plots", property_supertype_id: 3)
    PropertyType.where(id: [10, 37]).update_all(property_type_group_id: land.id)
  end
end
