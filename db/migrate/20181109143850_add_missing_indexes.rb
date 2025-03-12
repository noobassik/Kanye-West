class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :seo_location_pages, [:object_id, :object_type]
    add_index :seo_location_pages, [:default_page_id, :object_type, :object_id], unique: true , name: "plm_seo_loc_p_locations_m_to_m_idx"
    add_index :seo_location_pages, [:default_page_id]
  end
end
