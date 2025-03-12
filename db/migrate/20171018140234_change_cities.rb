class ChangeCities < ActiveRecord::Migration[5.1]
  def change
    drop_table :cities
    create_table "cities", force: :cascade do |t|
      t.string "name", limit: 200, default: ""
      t.string "asciiname", limit: 200, default: ""
      t.float "latitude", default: 0
      t.float "longitude", default: 0
      t.string "fcode", limit: 10, default: ""
      t.string "admin1", limit: 20, default: ""
      t.string "admin2", limit: 80, default: ""
      t.string "admin3", limit: 20, default: ""
      t.string "admin4", limit: 20, default: ""
      t.string "continent", limit: 20
      t.string "url", default: ""
      t.belongs_to :country, index: true
      t.belongs_to :region, index: true
      t.timestamps
    end

    add_index :cities, :name,                unique: false
  end
end
