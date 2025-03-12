class CreateSeoArticlesPage < ActiveRecord::Migration[5.2]
  def change
    create_table :seo_articles_pages do |t|
      t.string :h1_ru
      t.string :h1_en
      t.string :title_ru
      t.string :title_en
      t.text :description_ru, default: ""
      t.text :description_en, default: ""
      t.text :meta_description_ru, default: ""
      t.text :meta_description_en, default: ""

      # t.integer :object_id
      # t.string :object_type
      t.integer :default_page_id

      t.belongs_to :article_category

      t.integer :page_type

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end

    SeoArticlesPage.create(h1_ru: 'Статьи',
                           h1_en: 'Real estate articles',
                           title_ru: 'Статьи о недвижимости по всему миру',
                           title_en: 'Articles about real estate all over the world',
                           meta_description_ru: 'Статьи о недвижимости по всему миру: инвестиции, покупка и оформление недвижимости, условия получения ВНЖ, налоги',
                           meta_description_en: 'Real estate news and advice for buyers, sellers, and realtors',
                           page_type: 0)

    SeoArticlesPage.create(h1_ru: 'Статьи',
                           h1_en: 'Real estate articles',
                           title_ru: 'Статьи о недвижимости по всему миру',
                           title_en: 'Articles about real estate all over the world',
                           meta_description_ru: 'Статьи о недвижимости по всему миру: инвестиции, покупка и оформление недвижимости, условия получения ВНЖ, налоги',
                           meta_description_en: 'Real estate news and advice for buyers, sellers, and realtors',
                           page_type: 2)

    SeoArticlesPage.create(h1_ru: 'Статьи',
                           h1_en: 'Real estate articles',
                           title_ru: 'Статьи и обзоры {area_locative}',
                           title_en: 'Articles about real estate {area_locative}',
                           meta_description_ru: 'Статьи и обзоры {area_locative}: инвестиции, покупка и оформление недвижимости, условия получения ВНЖ, налоги',
                           meta_description_en: 'Real estate news and advice {area_locative} for buyers, sellers, and realtors',
                           page_type: 1)
  end
end
