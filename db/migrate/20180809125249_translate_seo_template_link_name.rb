class TranslateSeoTemplateLinkName < ActiveRecord::Migration[5.2]
  def change
    rename_column :seo_templates, :link_name, :link_name_ru
    add_column :seo_templates, :link_name_en, :string

    # SeoTemplate.find_by(slug: [nil, ''],
    #                     property_supertype_id: PropertySupertype::COMMERCIAL,
    #                     undeletable: true).update_attribute(:link_name_en, 'Commercial')
    #
    # SeoTemplate.find_by(slug: [nil, ''],
    #                     property_supertype_id: PropertySupertype::RESIDENTIAL,
    #                     undeletable: true).update_attribute(:link_name_en, 'Residential')
    #
    # SeoTemplate.find_by(slug: [nil, ''],
    #                     property_supertype_id: PropertySupertype::LAND,
    #                     undeletable: true).update_attribute(:link_name_en, 'Land')
    #
    # SeoTemplate.find_by(slug: [nil, ''],
    #                     template_location_type: SeoTemplate::TYPE_COUNTRIES,
    #                     undeletable: true).update_attribute(:link_name_en, 'Countries')
    #
    # SeoTemplate.find_by(slug: [nil, ''],
    #                     template_location_type: SeoTemplate::TYPE_REGIONS,
    #                     undeletable: true).update_attribute(:link_name_en, 'Regions')
    #
    # SeoTemplate.find_by(slug: [nil, ''],
    #                     template_location_type: SeoTemplate::TYPE_CITIES,
    #                     undeletable: true).update_attribute(:link_name_en, 'Cities')
  end
end
