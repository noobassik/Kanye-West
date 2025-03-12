class ChangeCountries < ActiveRecord::Migration[5.1]
  def change
    drop_table :countries
    create_table "countries", force: :cascade do |t|
      t.string "name", limit: 200, default: ""
      t.string "asciiname", limit: 200, default: ""
      t.float "latitude", default: 0
      t.float "longitude", default: 0
      t.string "iso_alpha2", limit: 2, default: ""
      t.string "capital", limit: 200, default: ""
      t.string "continent", limit: 2, default: ""
      t.string "currencycode", limit: 3, default: ""
      t.string "currencyname", limit: 20, default: ""
      t.string "languages", limit: 200, default: ""
      t.string "url", default: ""
      t.timestamps
    end
    add_index :countries, :name,                unique: true
    add_index :countries, :continent,                unique: false
  end
end
