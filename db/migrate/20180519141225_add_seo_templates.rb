class AddSeoTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :seo_templates do |t|
      t.string :name
      t.string :link_name
      t.string :slug
      t.integer :view_mode
      t.integer :template_location_type

      t.integer :property_supertype_id
      t.integer :property_type_id
      t.json :filter_params, null: false

      t.string :h1_ru
      t.string :h1_en
      t.string :title_ru
      t.string :title_en
      t.text :page_description_ru, default: ''
      t.text :page_description_en, default: ''
      t.text :meta_description_ru, default: ''
      t.text :meta_description_en, default: ''

      t.timestamps
    end
    execute "ALTER TABLE seo_templates ALTER COLUMN filter_params SET DEFAULT '{}'::JSON"

    create_table :seo_templates_areas do |t|
      t.belongs_to :seo_template
      t.references :locatable, polymorphic: true, index: true
    end

    add_index :seo_templates_areas, [:seo_template_id, :locatable_type, :locatable_id], name: 'plm_seo_templates_areas_m_to_m_idx'
    add_index :seo_templates_areas, [:locatable_id, :locatable_type], name: 'plm_seo_templates_areas_locatable_idx'
  end
end
