class CreateProperty < ActiveRecord::Migration[5.1]
  def change

    # Типы: коммерческая, некоммерческая, земля
    create_table :property_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Типы домов: коттедж, вилла, бунгало (дом с верандой), шале, таунхаус, замок
    create_table :house_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Тип земли: земля, остров...
    create_table :land_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Расположение: у моря, у озера, и т.д.
    create_table :near_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Типы расположения домов: городской, загородный, пещерный, деревянный
    create_table :house_location_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Тип расположения: в центре города, на окраине города, в черте города, в области
    create_table :location_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Количество комнат: студия, 1, 2...
    create_table :room_counts do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Стадия строительства
    create_table :building_stages do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Прилегающая территория: сад, пруд...
    create_table :adjoining_territories do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Тип окупаемости: доход...
    create_table :recoupment_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Тип владения: собственность, право аренды
    create_table :ownership_types  do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Тип парковки: нет, закрытый, открытый, гараж
    create_table :parking_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Тип водоема
    create_table :pond_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    # Недвижимость
    create_table :properties do |t|
      t.string :type

      t.string :h1_ru
      t.string :h1_en

      t.text :attributes_ru
      t.text :attributes_en

      t.text :description_two_ru
      t.text :description_two_en
      t.text :description_three_ru
      t.text :description_three_en

      t.float :latitude
      t.float :longitude

      t.integer :sale_price_rub
      t.integer :sale_price_usd
      t.integer :sale_price_eur
      t.integer :sale_price_unit #?

      t.integer :rent_price_rub_per_day
      t.integer :rent_price_usd_per_day
      t.integer :rent_price_eur_per_day
      t.integer :rent_price_unit_per_day #?

      t.integer :rent_price_rub_per_week
      t.integer :rent_price_usd_per_week
      t.integer :rent_price_eur_per_week
      t.integer :rent_price_unit_per_week #?

      t.integer :rent_price_rub_per_month
      t.integer :rent_price_usd_per_month
      t.integer :rent_price_eur_per_month
      t.integer :rent_price_unit_per_month #?

      t.integer :to_airport
      t.integer :to_airport_unit #?

      t.integer :to_station
      t.integer :to_station_unit #?

      t.integer :to_beach
      t.integer :to_beach_unit #?

      t.integer :to_historical_city_center
      t.integer :to_historical_city_center_unit #?

      t.integer :to_nearest_major_settlement
      t.integer :to_nearest_major_settlement_unit #?

      t.integer :to_nearest_settlement
      t.integer :to_nearest_settlement_unit #?

      t.integer :to_food_stores
      t.integer :to_food_stores_unit #?

      t.integer :to_health_facilities
      t.integer :to_health_facilities_unit #?

      t.boolean :street_retail
      t.boolean :redevelopment
      t.boolean :new_building
      t.boolean :bank_property
      t.boolean :from_builder

      t.string :country_name_ru
      t.string :region_name_ru
      t.string :city_name_ru
      t.string :country_name_en
      t.string :region_name_en
      t.string :city_name_en

      t.string :subtype_ru
      t.string :subtype_en

      t.text :additional_area_ru
      t.text :additional_area_en

      t.belongs_to :country, index: true
      t.belongs_to :region, index: true
      t.belongs_to :city, index: true

      t.belongs_to :agency, index: true
      t.belongs_to :property_type, index: true
      t.belongs_to :location_type, index: true
      t.belongs_to :near_type, index: true

      t.string :prian_link

      t.timestamps
    end

    # Некомерческая недвижимость
    create_table :noncommercial_property_attributes do |t|
      t.date :building_year
      t.integer :floor
      t.integer :count_floors
      t.boolean :with_swimming_pool
      t.boolean :protected_area
      t.boolean :shops_nearby
      t.boolean :with_furniture
      t.boolean :with_tv
      t.boolean :with_internet
      t.boolean :first_line_of_beach

      t.belongs_to :building_stage, index: true
      t.belongs_to :room_count, index: true
      t.belongs_to :property, index: true
    end

    # Квартиры
    create_table :apartment_attributes do |t|
      t.integer :space
      t.integer :space_unit
      t.integer :count_bathrooms
      t.integer :count_bedrooms
      t.boolean :with_elevator

      t.belongs_to :noncommercial_property, index: true
    end

    # Дома
    create_table :house_attributes do |t|
      t.integer :area_space
      t.integer :area_space_unit

      t.boolean :with_plot
      t.boolean :with_parking
      t.boolean :with_terrace

      t.belongs_to :house_type, index: true
      t.belongs_to :house_location_type, index: true
      t.belongs_to :noncommercial_property, index: true
      t.belongs_to :adjoining_territory, index: true
    end

    # Коммерческая недвижимость
    create_table :commercial_property_attributes do |t|
      t.boolean :works_now
      t.boolean :with_business

      t.integer :rentable_area
      t.integer :rentable_area_unit # ?
      t.integer :rental_yield_per_year
      t.integer :rental_yield_per_year_unit
      t.integer :rental_yield_per_month
      t.integer :rental_yield_per_month_unit
      t.integer :min_absolute_income
      t.integer :min_absolute_income_unit
      t.integer :min_amount_of_own_capital

      t.date :building_year
      t.date :last_repair

      t.belongs_to :room_count, index: true
      t.belongs_to :recoupment_type, index: true
      t.belongs_to :ownership_type, index: true
      t.belongs_to :parking_type, index: true
      t.belongs_to :property, index: true
    end

    # Земля
    create_table :land_attributes do |t|
      t.integer :area_space
      t.integer :area_space_unit

      t.string :place_name

      t.boolean :with_beach
      t.boolean :for_building
      t.boolean :buildings_exist
      t.boolean :electricity
      t.boolean :gas
      t.boolean :water

      t.belongs_to :pond_type, index: true
      t.belongs_to :land_type, index: true
      t.belongs_to :property, index: true
    end
  end
end
