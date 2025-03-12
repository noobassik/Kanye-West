class RenameSeoTemplateDescription < ActiveRecord::Migration[5.1]
  def change
    rename_column :seo_templates, :page_description_ru, :description_ru
    rename_column :seo_templates, :page_description_en, :description_en
  end
end
