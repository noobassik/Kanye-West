class AddHomeoverseasPropertiesToAgency < ActiveRecord::Migration[5.1]
  def change
    add_column :agencies, :homesoverseas_link, :string
    add_column :agencies, :homesoverseas_properties_links, :text

    add_column :agencies, :org_name_ru, :string
    add_column :agencies, :org_name_en, :string
  end
end
