class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :title_ru
      t.string :title_ua
      t.string :title_be
      t.string :title_en
      t.string :title_es
      t.string :title_pt
      t.string :title_de
      t.string :title_fr
      t.string :title_it
      t.string :title_pl
      t.string :title_ja
      t.string :title_lt
      t.string :title_lv
      t.string :title_cz
      t.string :title_genitive_ru
      t.string :url

      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
