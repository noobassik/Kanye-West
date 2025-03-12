class PropertyTagsToSeoTempllates < ActiveRecord::Migration[5.2]
  def change
    create_join_table :property_tags, :seo_templates do |t|
      t.index :property_tag_id
      t.index :seo_template_id
      t.index [ :property_tag_id, :seo_template_id ], name: "index_property_tags_on_seo_templates", unique: true
    end


    old_tags = ["street_retail",
                "redevelopment",
                "bank_property", # может не совпадать с английским названием
                "from_builder",
                "with_elevator",
                "with_parking",
                "in_credit",
                "in_mortgage",

                "works_now",
                "with_business",

                "with_swimming_pool",
                "protected_area",
                "shops_nearby",
                "with_furniture",
                "with_tv",
                "with_internet",
                "first_line_of_beach",

                "with_plot",
                "with_terrace",

                "with_beach",
                "for_commercial_building",
                "for_residential_building",
                "has_buildings", # может не совпадать с английским названием, таких шаблонов нет
                "electricity",
                "gas",
                "water",
                "agricultural"]


    templates_count = SeoTemplate.count
    SeoTemplate.all.each_with_index do |template, index|
      p "--- SeoTemplate #{index + 1} of #{templates_count}" unless index % 10

      PropertyTag.all.each do |property_tag|
        key_by_tag_name = property_tag.title_en.downcase.gsub(" ", "_")

        if template.filter_params.any? { |k, v| k == key_by_tag_name && v == 'on' }
          template.property_tags << property_tag
        end
      end

      template.update(filter_params: template.filter_params.delete_if { |k, _| old_tags.include?(k) })
    end
  end
end
