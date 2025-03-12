class AddSeoAgenciesPage < ActiveRecord::Migration[5.2]
  def change
    create_table :seo_agency_pages do |t|
      t.string :h1_ru
      t.string :h1_en
      t.string :title_ru
      t.string :title_en
      t.text :description_ru, default: ""
      t.text :description_en, default: ""
      t.text :meta_description_ru, default: ""
      t.text :meta_description_en, default: ""

      t.integer :agency_id
      t.index :agency_id

      t.boolean :is_active, default: true
      t.integer :default_page_id
      t.index :default_page_id

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    create_table :seo_agencies_pages do |t|
      t.string :h1_ru
      t.string :h1_en
      t.string :title_ru
      t.string :title_en
      t.text :description_ru, default: ""
      t.text :description_en, default: ""
      t.text :meta_description_ru, default: ""
      t.text :meta_description_en, default: ""

      t.integer :object_id
      t.string :object_type

      t.boolean :is_active, default: true
      t.integer :default_page_id

      t.integer :agencies_count, default: 0

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    add_index :seo_agencies_pages, [:object_id, :object_type]
    add_index :seo_agencies_pages, [:default_page_id, :object_type, :object_id], unique: true , name: "plm_seo_ags_p_locations_m_to_m_idx"
    add_index :seo_agencies_pages, [:default_page_id]



    default_agency_page =
        SeoAgencyPage.create!(title_ru: 'Агентство недвижимости: {agency_name} ({priority_country_title})',
                              title_en: '{agency_name}: Real Estate Agent ({priority_country_title})',
                              h1_ru: 'Агентство недвижимости: {agency_name} ({priority_country_title})',
                              h1_en: '{agency_name}: Real Estate Agent ({priority_country_title})',
                              meta_description_ru: 'Информация об агентстве недвижимости {agency_name}, контакты компании: прямые номера телефонов, официальный сайт, адрес, расположение на карте. Перечень недвижимости, услуг, имена менеджеров.',
                              meta_description_en: 'Full information about Real Estate Agent: {agency_name}. Direct contacts: telephone numbers, official website, address, location on the map.')

    default_agencies_page =
        SeoAgenciesPage.create!(title_ru: 'Агентства недвижимости {area_locative}',
                                title_en: 'Real estate agencies {area_locative}',
                                h1_ru: 'Агентства недвижимости {area_locative}',
                                h1_en: 'Real estate agencies {area_locative}',
                                meta_description_ru: 'Список агентств недвижимости со всего мира с объявлениями о продаже и сдаче в аренду жилых и коммерческих объектов. Описание компаний и прямые контакты (ссылки на официальные сайты).',
                                meta_description_en: 'List of real estate agencies from around the world with ads for the sale and rental of residential and commercial properties. Description of companies and direct contacts (links to official sites).'
        )

    agencies_count = Agency.count

    Agency.all.each_with_index do |a, index|
      p "--- Agency #{index + 1} of #{agencies_count}" if agencies_count % 10 == 0

      SeoAgencyPage.create!(meta_description_ru: a.meta_description_ru,
                            meta_description_en: a.meta_description_en,
                            agency_id: a.id,
                            default_page_id: default_agency_page.id,
                            )

      a.countries.each do |c|
        if SeoAgenciesPage.where(object_id: c.id,
                                 object_type: c.class.name,
                                 default_page_id: default_agencies_page.id).empty?
          SeoAgenciesPage.create!(object_id: c.id,
                                  object_type: c.class.name,
                                  default_page_id: default_agencies_page.id)
        end
      end

      a.regions.each do |r|
        if SeoAgenciesPage.where(object_id: r.id,
                                 object_type: r.class.name,
                                 default_page_id: default_agencies_page.id).empty?
          SeoAgenciesPage.create!(object_id: r.id,
                                  object_type: r.class.name,
                                  default_page_id: default_agencies_page.id)
        end
      end

      a.cities.each do |c|
        if SeoAgenciesPage.where(object_id: c.id,
                                 object_type: c.class.name,
                                 default_page_id: default_agencies_page.id).empty?
          SeoAgenciesPage.create!(object_id: c.id,
                                  object_type: c.class.name,
                                  default_page_id: default_agencies_page.id)
        end
      end
    end

    remove_column :agencies, :meta_description_ru
    remove_column :agencies, :meta_description_en
  end
end
