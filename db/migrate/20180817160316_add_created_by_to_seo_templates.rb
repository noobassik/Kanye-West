class AddCreatedByToSeoTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :seo_templates, :created_by, :integer
    add_column :seo_templates, :updated_by, :integer
  end
end
