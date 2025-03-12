class AddEnglishTitleForLocation < ActiveRecord::Migration[5.1]
  def change
    rename_column :countries, :asciiname, :title_en
    rename_column :regions, :asciiname, :title_en
    rename_column :cities, :asciiname, :title_en
  end
end
