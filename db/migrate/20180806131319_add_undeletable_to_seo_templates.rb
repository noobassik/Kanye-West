class AddUndeletableToSeoTemplates < ActiveRecord::Migration[5.1]
  def change
    add_column :seo_templates, :undeletable, :boolean, default: false
    change_column_default :seo_templates, :view_mode, 0
    change_column_default :seo_templates, :template_location_type, 0

    # коммерческая
    I18n.locale = :ru
    h1_ru = "Коммерческая недвижимость"
    title_ru = "Купить коммерческую недвижимость: цены"
    meta_description_ru = "Каталог коммерческой недвижимости. Выбирайте по цене, фотографиям, расположению на карте."

    I18n.locale = :en
    h1_en = "Commercial"
    title_en = "Buy commercial real estate: prices"
    meta_description_en = "Catalog of commercial real estate. Choose by price, photos, location on the map."

    SeoTemplate.create!(name: 'Коммерческая', link_name: 'Коммерческая', template_location_type: 0, property_supertype_id: 1,
                        h1_ru: h1_ru, h1_en: h1_en,
                        title_ru: title_ru, title_en: title_en,
                        meta_description_ru: meta_description_ru, meta_description_en: meta_description_en,
                        filter_params: {},
                        undeletable: true)

    # жилая
    I18n.locale = :ru
    h1_ru = "Жилая недвижимость"
    title_ru = "Купить жилую недвижимость: цены"
    meta_description_ru = "Каталог жилой недвижимости. Выбирайте по цене, фотографиям, расположению на карте."

    I18n.locale = :en
    h1_en = "Residential"
    title_en = "Buy residential real estate: prices"
    meta_description_en = "Catalog of residential real estate. Choose by price, photos, location on the map."

    SeoTemplate.create!(name: 'Жилая', link_name: 'Жилая', template_location_type: 0, property_supertype_id: 2,
                        h1_ru: h1_ru, h1_en: h1_en,
                        title_ru: title_ru, title_en: title_en,
                        meta_description_ru: meta_description_ru, meta_description_en: meta_description_en,
                        filter_params: {},
                        undeletable: true)

    # земля
    I18n.locale = :ru
    h1_ru = "Земельные участки"
    title_ru = "Купить земельный участок: цены"
    meta_description_ru = "Каталог земельных участков. Выбирайте по цене, фотографиям, расположению на карте."

    I18n.locale = :en
    h1_en = "Land"
    title_en = "Buy land: prices"
    meta_description_en = "Catalog of land plots. Choose by price, photos, location on the map."

    SeoTemplate.create!(name: 'Земля', link_name: 'Земля', template_location_type: 0, property_supertype_id: 3,
                        h1_ru: h1_ru, h1_en: h1_en,
                        title_ru: title_ru, title_en: title_en,
                        meta_description_ru: meta_description_ru, meta_description_en: meta_description_en,
                        filter_params: {},
                        undeletable: true)

    # страна
    I18n.locale = :ru
    h1_ru = "Недвижимость {area_locative}"
    title_ru = "Купить недвижимость {area_locative}: цены на жилье"
    meta_description_ru = "Каталог недвижимости {area_locative}: квартиры, коттеджи, коммерческие объекты, земельные участки, всего {properties_count}. Выбирайте по цене, фотографиям, расположению на карте."

    I18n.locale = :en
    h1_en = "Real Estate {area_locative}"
    title_en = "Buy real estate {area_locative}: Housing prices"
    meta_description_en = "Real Estate Directory {area_locative}: apartments, cottages, commercial properties, land, total {properties_count}. Choose by price, photos, location on the map."

    SeoTemplate.create!(name: 'Страны', link_name: 'Страны', template_location_type: 1, property_supertype_id: 0,
                        h1_ru: h1_ru, h1_en: h1_en,
                        title_ru: title_ru, title_en: title_en,
                        meta_description_ru: meta_description_ru, meta_description_en: meta_description_en,
                        filter_params: {},
                        undeletable: true)

    # регион
    I18n.locale = :ru
    h1_ru = "Недвижимость {area_locative}"
    title_ru = "Купить недвижимость {area_full_name_locative}: цены"
    meta_description_ru = "Каталог недвижимости {area_full_name_locative}: квартиры, коттеджи, коммерческие объекты, земельные участки, всего {properties_count}. Выбирайте по цене, фотографиям, расположению на карте."

    I18n.locale = :en
    h1_en = "Real Estate {area_locative}"
    title_en = "Buy real estate {area_full_name_locative}: prices"
    meta_description_en = "Real Estate Directory {area_full_name_locative}: apartments, cottages, commercial properties, land, total {properties_count}. Choose by price, photos, location on the map."

    SeoTemplate.create!(name: 'Регионы', link_name: 'Регионы', template_location_type: 2, property_supertype_id: 0,
                        h1_ru: h1_ru, h1_en: h1_en,
                        title_ru: title_ru, title_en: title_en,
                        meta_description_ru: meta_description_ru, meta_description_en: meta_description_en,
                        filter_params: {},
                        undeletable: true)

    # город
    I18n.locale = :ru
    h1_ru = "Недвижимость {area_locative}"
    title_ru = "Купить недвижимость {area_full_name_locative}: цены"
    meta_description_ru = "Каталог недвижимости {area_full_name_locative}: квартиры, коттеджи, коммерческие объекты, земельные участки, всего {properties_count}. Выбирайте по цене, фотографиям, расположению на карте."

    I18n.locale = :en
    h1_en = "Real Estate {area_locative}"
    title_en = "Buy real estate {area_full_name_locative}: prices"
    meta_description_en = "Real Estate Directory {area_full_name_locative}: apartments, cottages, commercial properties, land, total {properties_count}. Choose by price, photos, location on the map."

    SeoTemplate.create!(name: 'Города', link_name: 'Города', template_location_type: 3, property_supertype_id: 0,
                        h1_ru: h1_ru, h1_en: h1_en,
                        title_ru: title_ru, title_en: title_en,
                        meta_description_ru: meta_description_ru, meta_description_en: meta_description_en,
                        filter_params: {},
                        undeletable: true)

  end
end
