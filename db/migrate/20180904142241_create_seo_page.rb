class CreateSeoPage < ActiveRecord::Migration[5.2]
  def change
    create_table :seo_template_pages do |t|
      t.string :h1_ru
      t.string :h1_en
      t.string :title_ru
      t.string :title_en
      t.text :description_ru, default: ""
      t.text :description_en, default: ""
      t.text :meta_description_ru, default: ""
      t.text :meta_description_en, default: ""

      t.integer :seo_template_id

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    create_table :seo_location_pages do |t|
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

      t.integer :properties_count, default: 0

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end



    SeoTemplate.all.each do |st|
      sp = SeoTemplatePage.create(h1_ru: st.h1_ru,
                                  h1_en: st.h1_en,
                                  title_ru: st.title_ru,
                                  title_en: st.title_en,
                                  description_ru: st.description_ru,
                                  description_en: st.description_en,
                                  meta_description_ru: st.meta_description_ru,
                                  meta_description_en: st.meta_description_en,
                                  seo_template_id: st.id,
      )

      if st.locations.present?
        st.locations.active.each do |l|
          SeoLocationPage.create(default_page_id: sp.id,
                                 object_id: l.id,
                                 object_type: l.class.name,
                                 properties_count: 0
          )
        end
      end
    end

    # SeoLocationPage.all.each do |page|
    #   params = SeoTemplate::Presenter.new(page.seo_template).to_params
    #   params["#{page.object_type}_id".downcase] = page.object_id
    #   properties_count = SearchProperties.new(params).perform.count
    #   page.update(properties_count: properties_count)
    # end

    remove_column :seo_templates, :h1_ru
    remove_column :seo_templates, :h1_en
    remove_column :seo_templates, :title_ru
    remove_column :seo_templates, :title_en
    remove_column :seo_templates, :description_ru
    remove_column :seo_templates, :description_en
    remove_column :seo_templates, :meta_description_ru
    remove_column :seo_templates, :meta_description_en
  end
end
