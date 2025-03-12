class AddAdditionalFieldsToLocationsAndProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :short_page_title_ru, :string
    add_column :properties, :short_page_title_en, :string

    add_column :properties, :page_title_ru, :string
    add_column :properties, :page_title_en, :string

    add_column :properties, :page_h1_ru, :string
    add_column :properties, :page_h1_en, :string

    add_column :properties, :meta_description_ru, :string
    add_column :properties, :meta_description_en, :string

    [:countries, :regions, :cities].each do |location|
      add_column location, :page_title_ru, :string
      add_column location, :page_title_en, :string

      add_column location, :page_h1_ru, :string
      add_column location, :page_h1_en, :string

      add_column location, :meta_description_ru, :string
      add_column location, :meta_description_en, :string

      add_column location, :description_ru, :string
      add_column location, :description_en, :string

      add_column location, :title_genitive_ru, :string
      add_column location, :title_prepositional_ru, :string
      add_column location, :title_genitive_en, :string
      add_column location, :title_prepositional_en, :string
    end
  end
end
