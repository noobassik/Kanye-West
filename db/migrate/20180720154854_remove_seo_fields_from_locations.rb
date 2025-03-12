class RemoveSeoFieldsFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :countries, :page_title_ru
    remove_column :countries, :page_title_en
    remove_column :countries, :page_h1_ru
    remove_column :countries, :page_h1_en
    remove_column :countries, :meta_description_ru
    remove_column :countries, :meta_description_en

    remove_column :regions, :page_title_ru
    remove_column :regions, :page_title_en
    remove_column :regions, :page_h1_ru
    remove_column :regions, :page_h1_en
    remove_column :regions, :meta_description_ru
    remove_column :regions, :meta_description_en

    remove_column :cities, :page_title_ru
    remove_column :cities, :page_title_en
    remove_column :cities, :page_h1_ru
    remove_column :cities, :page_h1_en
    remove_column :cities, :meta_description_ru
    remove_column :cities, :meta_description_en
  end
end
