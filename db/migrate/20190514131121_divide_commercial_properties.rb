class DivideCommercialProperties < ActiveRecord::Migration[5.2]
  def change
    warehouse_ids = []
    rental_house_ids = []
    office_ids = []
    production_ids = []
    restaurant_ids = []
    shop_ids = []
    hotel_ids = []
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

    properties_count = Property.where('h1_ru IS NOT NULL OR h1_en IS NOT NULL').count
    Property.where('h1_ru IS NOT NULL OR h1_en IS NOT NULL').each_with_index do |property, index|
      p "Update " + index.to_s + " property of " + properties_count.to_s if index % 1000 == 0
      if property.property_type_id == 2
        if property.h1_ru&.match?(/[Сс]клад/)
          warehouse_ids << property.id
        elsif property.h1_ru&.match?(/[Дд]оходный [Дд]ом/)
          rental_house_ids << property.id
        elsif property.h1_ru&.match?(/[Оо]фисные помещения/)
          office_rooms_ids << property.id
        elsif  property.h1_ru&.match?(/[Оо]фис/)
          office_ids << property.id
        elsif  property.h1_ru&.match?(/[Пп]роизводство/)
          production_ids << property.id
        elsif property.h1_ru&.match?(/[Рр]есторан[^о]/) || property.h1_ru&.match?(/[Кк]афе/)
          restaurant_ids << property.id
        elsif property.h1_ru&.match?(/[Мм]агазин[^о]/)
          shop_ids << property.id
        elsif property.h1_ru&.match?(/[Оо]тель/) || property.h1_ru&.match?(/[Гг]остиница/)
          hotel_ids << property.id
        elsif property.h1_ru&.match?(/[Бб]изнес-центр[^е]/)
          business_center_ids << property.id
        elsif property.h1_ru&.match?(/[Сс]упермаркета?[^е]/)
          supermarket_ids << property.id
        elsif property.h1_ru&.match?(/[Хх]остел/)
          hostel_ids << property.id
        elsif property.h1_ru&.match?(/[Гг]остевой [Дд]ом/)
          guest_house_ids << property.id
        elsif property.h1_ru&.match?(/[Аа]парт-отель/)
          apartment_hotel_ids << property.id
        elsif property.h1_ru&.match?(/[Вв]иноградник/)
          vineyard_ids << property.id
        elsif property.h1_ru&.match?(/[Тт]орговый [Цц]ентр/) || property.h1_ru&.match?(/Т\/Ц/) || property.h1_ru&.match?(/Торгово-развлекательный центр/)
          shopping_center_ids << property.id
        elsif property.h1_ru&.match?(/[Пп]ансион/)
          boarding_house_ids << property.id
        elsif property.h1_ru&.match?(/[Тт]орговое [Пп]омещение/)
          commercial_premises_ids << property.id
        end
      end
    end

    Property.where(id: warehouse_ids).update_all(property_type_id: 18)
    Property.where(id: rental_house_ids).update_all(property_type_id: 16)
    Property.where(id: office_ids).update_all(property_type_id: 14)
    Property.where(id: production_ids).update_all(property_type_id: 13)
    Property.where(id: restaurant_ids).update_all(property_type_id: 12)
    Property.where(id: shop_ids).update_all(property_type_id: 9)
    Property.where(id: hotel_ids).update_all(property_type_id: 6)
    Property.where(id: business_center_ids).update_all(property_type_id: 27)
    Property.where(id: supermarket_ids).update_all(property_type_id: 28)
    Property.where(id: hostel_ids).update_all(property_type_id: 29)
    Property.where(id: guest_house_ids).update_all(property_type_id: 30)
    Property.where(id: apartment_hotel_ids).update_all(property_type_id: 31)
    Property.where(id: vineyard_ids).update_all(property_type_id: 32)
    Property.where(id: office_rooms_ids).update_all(property_type_id: 33)
    Property.where(id: shopping_center_ids).update_all(property_type_id: 34)
    Property.where(id: boarding_house_ids).update_all(property_type_id: 35)
    Property.where(id: commercial_premises_ids).update_all(property_type_id: 36)
  end
end
