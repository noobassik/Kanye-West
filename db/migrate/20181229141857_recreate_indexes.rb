class RecreateIndexes < ActiveRecord::Migration[5.2]
  def change
    remove_index :pictures, name: "index_pictures_on_imageable_type_and_imageable_id"
    remove_index :seo_agencies_pages, name: "plm_seo_ags_p_locations_m_to_m_idx"
    remove_index :seo_location_pages, name: "plm_seo_loc_p_locations_m_to_m_idx"
    remove_index :seo_templates_areas, name: "plm_seo_templates_areas_m_to_m_idx"

    add_index :pictures, [:imageable_id, :imageable_type]
    add_index :seo_agencies_pages, [:object_id, :default_page_id, :object_type], unique: true, name: "plm_seo_ags_p_locations_m_to_m_idx"
    add_index :seo_location_pages, [:object_id, :default_page_id, :object_type], unique: true, name: "plm_seo_loc_p_locations_m_to_m_idx"
    add_index :seo_templates_areas, [:locatable_id, :seo_template_id, :locatable_type], unique: true, name: "plm_seo_templates_areas_m_to_m_idx"
  end
end
