class CreateAlternateNames < ActiveRecord::Migration[5.1]
  def change
    create_table :alternate_names do |t|
      t.bigint "geoname_id"
      t.string "iso_language", limit: 80
      t.string "alternate_name", limit: 200
      t.string "continent", limit: 20
      t.timestamps
      t.index ["geoname_id"],name: "index_alternatenames_on_geoname_id"
    end
    add_index :alternate_names, :geoname_id,                unique: false
    add_index :alternate_names, :alternate_name,                unique: false
  end
end
