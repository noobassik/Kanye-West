class CreateArticleTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.string :title_ru
      t.string :title_en
      t.string :url
    end

    create_table :articles do |t|
      t.string :h1_ru
      t.string :h1_en
      t.string :title_ru
      t.string :title_en
      t.text :meta_description_ru, default: ""
      t.text :meta_description_en, default: ""

      t.text :short_description_ru, default: ""
      t.text :short_description_en, default: ""
      t.text :description_ru, default: ""
      t.text :description_en, default: ""

      t.boolean :is_active, default: false
      t.string :url

      t.belongs_to :article_category
      t.belongs_to :country

      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
