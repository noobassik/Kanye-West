class AddIndexForLocationTitle < ActiveRecord::Migration[5.1]
  def change
    add_index :cities, :title_ru
    add_index :cities, :title_en
    add_index :eu_cities, :title_ru
    add_index :eu_cities, :title_en
    add_index :as_cities, :title_ru
    add_index :as_cities, :title_en
    add_index :na_cities, :title_ru
    add_index :na_cities, :title_en
    add_index :an_cities, :title_ru
    add_index :an_cities, :title_en
    add_index :af_cities, :title_ru
    add_index :af_cities, :title_en
    add_index :sa_cities, :title_ru
    add_index :sa_cities, :title_en
    add_index :oc_cities, :title_ru
    add_index :oc_cities, :title_en
    add_index :china_and_india_cities, :title_ru
    add_index :china_and_india_cities, :title_en
    add_index :cities, :continent

    add_index :regions, :title_ru
    add_index :regions, :title_en

    add_index :countries, :title_ru
    add_index :countries, :title_en
  end
end
