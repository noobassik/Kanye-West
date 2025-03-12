class AddConstuctionPhaseToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :construction_phase, :integer
    add_index :properties, :construction_phase

    Property.where(new_building: true).update_all(construction_phase: 0)
    Property.where(off_plan: true).update_all(construction_phase: 1)
    Property.where(resale: true).update_all(construction_phase: 2)

    remove_column :properties, :new_building
    remove_column :properties, :off_plan
    remove_column :properties, :resale

    SeoTemplate.where("filter_params->>'new_building' = ?", 'on').each do |seo_template|
      filter_params = seo_template.filter_params
      filter_params.delete('new_building')
      filter_params.delete('off_plan')
      filter_params.delete('resale')
      seo_template.update(filter_params: filter_params.merge(construction_phase: 0))
    end

    SeoTemplate.where("filter_params->>'off_plan' = ?", 'on').each do |seo_template|
      filter_params = seo_template.filter_params
      filter_params.delete('new_building')
      filter_params.delete('off_plan')
      filter_params.delete('resale')
      seo_template.update(filter_params: filter_params.merge(construction_phase: 1))
    end

    SeoTemplate.where("filter_params->>'resale' = ?", 'on').each do |seo_template|
      filter_params = seo_template.filter_params
      filter_params.delete('new_building')
      filter_params.delete('off_plan')
      filter_params.delete('resale')
      seo_template.update(filter_params: filter_params.merge(construction_phase: 2))
    end
  end
end
