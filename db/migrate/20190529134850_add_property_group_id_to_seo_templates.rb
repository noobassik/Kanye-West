class AddPropertyGroupIdToSeoTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :seo_templates, :property_type_group_id, :integer

    # актуализировать существующие сео шаблоны
    PropertyType.all.each do |pt|
      SeoTemplate.where(property_type_id: pt.id).update_all(property_type_group_id: pt.property_type_group_id)
    end
  end
end
