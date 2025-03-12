class CreatePropertyTags < ActiveRecord::Migration[5.2]
  def change
    create_table :property_tag_categories do |t|
      t.string :title_ru
      t.string :title_en
      t.belongs_to :property_supertype
    end

    create_table :property_tags do |t|
      t.string :title_ru
      t.string :title_en
      t.boolean :is_active, default: true

      # t.integer :filter_position, default: 0

      t.belongs_to :property_tag_category
    end

    create_join_table :properties, :property_tags do |t|
      t.index :property_id
      t.index :property_tag_id
      t.index [ :property_id, :property_tag_id ], name: "index_properties_on_property_tags", unique: true
    end

    # Создаем категории
    common = PropertyTagCategory.create!(title_ru: 'Общее', title_en: 'Common')
    commercial = PropertyTagCategory.create!(title_ru: 'Коммерческая', title_en: 'Commercial', property_supertype_id: PropertySupertype::COMMERCIAL)
    residential = PropertyTagCategory.create!(title_ru: 'Жилая', title_en: 'Residential', property_supertype_id: PropertySupertype::RESIDENTIAL)
    houses = PropertyTagCategory.create!(title_ru: 'Дома', title_en: 'Houses', property_supertype_id: PropertySupertype::RESIDENTIAL)
    lands = PropertyTagCategory.create!(title_ru: 'Земельные участки', title_en: 'Lands', property_supertype_id: PropertySupertype::LAND)


    # Создаем теги

    # Table name: properties
    #
    #  street_retail                  :boolean
    #  redevelopment                  :boolean
    #  bank_property                  :boolean
    #  from_builder                   :boolean
    #  with_elevator                  :boolean          default(FALSE)
    #  with_parking                   :boolean          default(FALSE)
    #  in_credit                      :boolean          default(FALSE)
    #  in_mortgage                    :boolean          default(FALSE)

    PropertyTag.create!(title_ru: 'Стрит ритейл', title_en: 'Street retail', property_tag_category: common)
    p "Street retail properties"
    add_last_tag_to_properties(Property.where(street_retail: true))


    PropertyTag.create!(title_ru: 'Редевелопмент', title_en: 'Redevelopment', property_tag_category: common)
    p "Redevelopment properties"
    add_last_tag_to_properties(Property.where(redevelopment: true))


    PropertyTag.create!(title_ru: 'Банковская недвижимость', title_en: 'Real Estate of bank', property_tag_category: common)
    p "Real Estate of bank properties"
    add_last_tag_to_properties(Property.where(bank_property: true))


    PropertyTag.create!(title_ru: 'От застройщика', title_en: 'From builder', property_tag_category: common)
    p "From builder properties"
    add_last_tag_to_properties(Property.where(from_builder: true))


    PropertyTag.create!(title_ru: 'С лифтом', title_en: 'With elevator', property_tag_category: common)
    p "With elevator properties"
    add_last_tag_to_properties(Property.where(with_elevator: true))


    PropertyTag.create!(title_ru: 'С парковкой', title_en: 'With parking', property_tag_category: common)
    p "With parking properties"
    add_last_tag_to_properties(Property.where(with_parking: true))


    PropertyTag.create!(title_ru: 'В кредит', title_en: 'In credit', property_tag_category: common)
    p "In credit properties"
    add_last_tag_to_properties(Property.where(in_credit: true))


    PropertyTag.create!(title_ru: 'В ипотеку', title_en: 'In mortgage', property_tag_category: common)
    p "In mortgage properties"
    add_last_tag_to_properties(Property.where(in_mortgage: true))



    # Table name: commercial_property_attributes
    #
    #  works_now                   :boolean
    #  with_business               :boolean

    PropertyTag.create!(title_ru: 'Работает в настоящее время', title_en: 'Works now', property_tag_category: commercial)
    p "Works now properties"
    add_last_tag_to_properties(Property.joins(:commercial_property_attribute)
                                   .where("commercial_property_attributes.works_now = ?", true))


    PropertyTag.create!(title_ru: 'Продается с готовым бизнесом', title_en: 'With business', property_tag_category: commercial)
    p "With business properties"
    add_last_tag_to_properties(Property.joins(:commercial_property_attribute)
                                   .where("commercial_property_attributes.with_business = ?", true))



    # Table name: noncommercial_property_attributes
    #
    #  with_swimming_pool  :boolean
    #  protected_area      :boolean
    #  shops_nearby        :boolean
    #  with_furniture      :boolean
    #  with_tv             :boolean
    #  with_internet       :boolean
    #  first_line_of_beach :boolean

    PropertyTag.create!(title_ru: 'С бассейном', title_en: 'With swimming pool', property_tag_category: residential)
    p "With swimming pool properties"
    add_last_tag_to_properties(Property.joins(:noncommercial_property_attribute)
                                   .where("noncommercial_property_attributes.with_swimming_pool = ?", true))


    PropertyTag.create!(title_ru: 'Охраняемая территория', title_en: 'Protected area', property_tag_category: residential)
    p "Protected area properties"
    add_last_tag_to_properties(Property.joins(:noncommercial_property_attribute)
                                   .where("noncommercial_property_attributes.protected_area = ?", true))


    PropertyTag.create!(title_ru: 'Магазины рядом', title_en: 'Shops nearby', property_tag_category: residential)
    p "Shops nearby properties"
    add_last_tag_to_properties(Property.joins(:noncommercial_property_attribute)
                                   .where("noncommercial_property_attributes.shops_nearby = ?", true))


    PropertyTag.create!(title_ru: 'С мебелью', title_en: 'With furniture', property_tag_category: residential)
    p "With furniture properties"
    add_last_tag_to_properties(Property.joins(:noncommercial_property_attribute)
                                   .where("noncommercial_property_attributes.with_furniture = ?", true))


    PropertyTag.create!(title_ru: 'С телевидением', title_en: 'With tv', property_tag_category: residential)
    p "With tv properties"
    add_last_tag_to_properties(Property.joins(:noncommercial_property_attribute)
                                   .where("noncommercial_property_attributes.with_tv = ?", true))


    PropertyTag.create!(title_ru: 'С интернетом', title_en: 'With internet', property_tag_category: residential)
    p "With internet properties"
    add_last_tag_to_properties(Property.joins(:noncommercial_property_attribute)
                                   .where("noncommercial_property_attributes.with_internet = ?", true))


    # PropertyTag.create!(title_ru: 'Первая линия пляжа', title_en: 'First line of beach')
    #     p "Street retail properties"
    #     add_last_tag_to_properties(Property.where(street_retail: true))
    # Property.joins(:noncommercial_property_attribute).where("noncommercial_property_attributes.first_line_of_beach = ?", true)



    # Table name: house_attributes
    #
    #  with_plot              :boolean
    #  with_terrace           :boolean

    PropertyTag.create!(title_ru: 'С участком', title_en: 'With plot', property_tag_category: houses)
    p "With plot properties"
    add_last_tag_to_properties(Property.joins(:house_attribute).where("house_attributes.with_plot = ?", true))


    PropertyTag.create!(title_ru: 'С террасой', title_en: 'With terrace', property_tag_category: houses)
    p "With terrace properties"
    add_last_tag_to_properties(Property.joins(:house_attribute).where("house_attributes.with_terrace = ?", true))



    # Table name: land_attributes
    #
    #  with_beach               :boolean
    #  for_commercial_building  :boolean
    #  for_residential_building :boolean
    #  has_buildings            :boolean
    #  electricity              :boolean
    #  gas                      :boolean
    #  water                    :boolean
    #  agricultural             :boolean

    PropertyTag.create!(title_ru: 'С пляжем', title_en: 'With beach', property_tag_category: lands)
    p "With beach properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.with_beach = ?", true))


    PropertyTag.create!(title_ru: 'Для коммерческого строительства', title_en: 'For commercial building', property_tag_category: lands)
    p "For commercial building properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.for_commercial_building = ?", true))


    PropertyTag.create!(title_ru: 'Для жилого строительства', title_en: 'For residential building', property_tag_category: lands)
    p "For residential building properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.for_residential_building = ?", true))


    PropertyTag.create!(title_ru: 'Есть постройки', title_en: 'Buildings exist', property_tag_category: lands)
    p "Buildings exist properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.has_buildings = ?", true))


    PropertyTag.create!(title_ru: 'Электричество', title_en: 'Electricity', property_tag_category: lands)
    p "Electricity properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.electricity = ?", true))


    PropertyTag.create!(title_ru: 'Газ', title_en: 'Gas', property_tag_category: lands)
    p "Gas properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.gas = ?", true))


    PropertyTag.create!(title_ru: 'Вода', title_en: 'Water', property_tag_category: lands)
    p "Water properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.water = ?", true))


    PropertyTag.create!(title_ru: 'Сельское хозяйство', title_en: 'Agricultural', property_tag_category: lands)
    p "Agricultural properties"
    add_last_tag_to_properties(Property.joins(:land_attribute).where("land_attributes.agricultural = ?", true))



    # Удаляем столбцы недвижимости
    remove_column :properties, :street_retail
    remove_column :properties, :redevelopment
    remove_column :properties, :bank_property
    remove_column :properties, :from_builder
    remove_column :properties, :with_elevator
    remove_column :properties, :with_parking
    remove_column :properties, :in_credit
    remove_column :properties, :in_mortgage

    remove_column :commercial_property_attributes, :works_now
    remove_column :commercial_property_attributes, :with_business

    remove_column :noncommercial_property_attributes, :with_swimming_pool
    remove_column :noncommercial_property_attributes, :protected_area
    remove_column :noncommercial_property_attributes, :shops_nearby
    remove_column :noncommercial_property_attributes, :with_furniture
    remove_column :noncommercial_property_attributes, :with_tv
    remove_column :noncommercial_property_attributes, :with_internet
    remove_column :noncommercial_property_attributes, :first_line_of_beach

    remove_column :house_attributes, :with_plot
    remove_column :house_attributes, :with_terrace

    remove_column :land_attributes, :with_beach
    remove_column :land_attributes, :for_commercial_building
    remove_column :land_attributes, :for_residential_building
    remove_column :land_attributes, :has_buildings
    remove_column :land_attributes, :electricity
    remove_column :land_attributes, :gas
    remove_column :land_attributes, :water
    remove_column :land_attributes, :agricultural
  end

  def add_last_tag_to_properties(properties)
    properties.each_with_index do |property, index|
      p "--- Property #{index + 1} of #{properties.count}" unless index % 10
      property.property_tags << PropertyTag.find(PropertyTag.last.id)
    end
  end
end
