class DividePropertyTypes < ActiveRecord::Migration[5.2]
  def change
    # Жилая
    apartment = PropertyType.find(3)
    apartment.update(title_ru: 'Апартаменты', title_en: 'Apartment')
    flat = PropertyType.create!(title_ru: 'Квартира', title_en: 'Flat', property_supertype_id: 2)
    penthouse = PropertyType.create!(title_ru: 'Пентхаус', title_en: 'Penthouse', property_supertype_id: 2)

    house = PropertyType.find(1)
    house.update(title_ru: 'Дом', title_en: 'House')
    chalet = PropertyType.create!(title_ru: 'Шале', title_en: 'Chalet', property_supertype_id: 2)
    villa = PropertyType.create!(title_ru: 'Вилла', title_en: 'Villa', property_supertype_id: 2)
    castle = PropertyType.create!(title_ru: 'Замок', title_en: 'Castle', property_supertype_id: 2)

    # Коммерческая
    business_center = PropertyType.create!(title_ru: 'Бизнес-центр', title_en: 'Business center', property_supertype_id: 1)

    supermarket = PropertyType.create!(title_ru: 'Супермаркет', title_en: 'Supermarket', property_supertype_id: 1)

    hostel = PropertyType.create!(title_ru: 'Хостел', title_en: 'Hostel', property_supertype_id: 1)
    guest_house = PropertyType.create!(title_ru: 'Гостевой дом', title_en: 'Guest house', property_supertype_id: 1)
    apartment_hotel = PropertyType.create!(title_ru: 'Апарт-отель', title_en: 'Apartment hotel', property_supertype_id: 1)

    vineyard = PropertyType.create!(title_ru: 'Виноградник', title_en: 'Vineyard', property_supertype_id: 1)
    office_rooms = PropertyType.create!(title_ru: 'Офисные помещения', title_en: 'Office rooms', property_supertype_id: 1)

    shopping_center = PropertyType.create!(title_ru: 'Торговый центр', title_en: 'Shopping center', property_supertype_id: 1)
    boarding_house = PropertyType.create!(title_ru: 'Пансион', title_en: 'Boarding house', property_supertype_id: 1)
    commercial_premises = PropertyType.create!(title_ru: 'Торговое помещение', title_en: 'Commercial premises', property_supertype_id: 1)

    # Земля
    land = PropertyType.find(10)
    land.update(title_ru: 'Земельный участок', title_en: 'Land plot')
    island = PropertyType.create!(title_ru: 'Остров', title_en: 'Island', property_supertype_id: 3)

    flat_ids = []
    penthouse_ids = []
    chalet_ids = []
    villa_ids = []
    castle_ids = []

    business_center_ids = []
    supermarket_ids = []
    hostel_ids = []
    guest_house_ids = []
    apartment_hotel_ids = []

    vineyard_ids = []
    office_rooms_ids = []

    shopping_center_ids = []
    boarding_house_ids = []
    commercial_premises_ids = []

    island_ids = []

    properties_count = Property.where('h1_ru IS NOT NULL OR h1_en IS NOT NULL').count
    Property.where('h1_ru IS NOT NULL OR h1_en IS NOT NULL').each_with_index do |property, index|
      p "Update houses " + index.to_s + " property of " + properties_count.to_s if index % 100 == 0
      if property.property_supertype_id == 2
        if property.h1_ru&.match?(/[Кк]вартир/)
          flat_ids << property.id
        elsif property.h1_en&.match?(/[Pp]enthouse/)
          penthouse_ids << property.id
        elsif property.h1_en&.match?(/[Cc]halet/)
          chalet_ids << property.id
        elsif property.h1_en&.match?(/[Vv]illa/)
          villa_ids << property.id
        elsif property.h1_en&.match?(/[Cc]astle/)
          castle_ids << property.id
        end
      elsif property.property_supertype_id == 1
        if property.h1_ru&.match?(/[Бб]изнес-центр[^е]/)
          business_center_ids << property.id
        elsif property.h1_ru&.match?(/[Сс]упермаркета?[^е]/)
          supermarket_ids << property.id
        elsif property.h1_ru&.match?(/[Хх]остел/)
          hostel_ids << property.id
        elsif property.h1_ru&.match?(/[Гг]остевой [Дд]ом/)
          guest_house_ids << property.id
        elsif property.h1_ru&.match?(/[Аа]парт-отель/)
          apartment_hotel_ids << property.id
        elsif property.h1_ru&.match?(/[Оо]фисные помещения/)
          office_rooms_ids << property.id
        elsif property.h1_ru&.match?(/[Тт]орговый [Цц]ентр/) || property.h1_ru&.match?(/Т\/Ц/) || property.h1_ru&.match?(/Торгово-развлекательный центр/)
          shopping_center_ids << property.id
        elsif property.h1_ru&.match?(/[Пп]ансион/)
          boarding_house_ids << property.id
        elsif property.h1_ru&.match?(/[Тт]орговое [Пп]омещение/)
          commercial_premises_ids << property.id
        end
      elsif property.property_supertype_id == 3
        if property.h1_ru&.match?(/Остров[^ае]/)
          island_ids << property.id
        end
      end

      if property.property_supertype_id.in?([3, 1])
        if property.h1_ru&.match?(/[Вв]иноградник/)
          vineyard_ids << property.id
        end
      end
    end

    Property.where(id: flat_ids).update_all(property_type_id: flat.id)
    Property.where(id: penthouse_ids).update_all(property_type_id: penthouse.id)
    Property.where(id: chalet_ids).update_all(property_type_id: chalet.id)
    Property.where(id: villa_ids).update_all(property_type_id: villa.id)
    Property.where(id: castle_ids).update_all(property_type_id: castle.id)

    Property.where(id: business_center_ids).update_all(property_type_id: business_center.id)
    Property.where(id: supermarket_ids).update_all(property_type_id: supermarket.id)
    Property.where(id: hostel_ids).update_all(property_type_id: hostel.id)
    Property.where(id: guest_house_ids).update_all(property_type_id: guest_house.id)
    Property.where(id: apartment_hotel_ids).update_all(property_type_id: apartment_hotel.id)

    Property.where(id: vineyard_ids).update_all(property_type_id: vineyard.id)
    Property.where(id: office_rooms_ids).update_all(property_type_id: office_rooms.id)

    Property.where(id: shopping_center_ids).update_all(property_type_id: shopping_center.id)
    Property.where(id: boarding_house_ids).update_all(property_type_id: boarding_house.id)
    Property.where(id: commercial_premises_ids).update_all(property_type_id: commercial_premises.id)

    Property.where(id: island_ids).update_all(property_type_id: island.id)
  end
end
