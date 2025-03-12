class RemoveDescriptionFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :countries, :description_ru
    remove_column :countries, :description_en

    remove_column :regions, :description_ru
    remove_column :regions, :description_en

    remove_column :cities, :description_ru
    remove_column :cities, :description_en
  end
end
