class AddIndexForLocations < ActiveRecord::Migration[5.1]
  def change
    add_index :cities, :title_en, unique: false
    add_index :cities, :title_ru, unique: false

    add_index :regions, :title_en, unique: false
    add_index :regions, :title_ru, unique: false

    add_index :countries, :title_en, unique: false
    add_index :countries, :title_ru, unique: false
  end
end
