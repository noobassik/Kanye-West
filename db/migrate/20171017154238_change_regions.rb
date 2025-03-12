class ChangeRegions < ActiveRecord::Migration[5.1]
  def change
    drop_table :regions
    say "Droped region table"
    create_table "regions", force: :cascade do |t|
      t.string "name", limit: 200, default: ""
      t.string "asciiname", limit: 200, default: ""
      t.float "latitude", default: 0
      t.float "longitude", default: 0
      t.string "admin1", limit: 20, default: ""
      t.string "url", default: ""
      t.belongs_to :country, index: true
      t.timestamps
    end
    add_index :regions, :name,                unique: false
    add_index :regions, :admin1,                unique: false
  end
end
