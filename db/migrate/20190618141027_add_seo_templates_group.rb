class AddSeoTemplatesGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :seo_templates_groups do |t|
      t.string :title_ru
      t.string :title_en
      t.boolean :is_active
    end

    add_reference :seo_templates, :seo_templates_group
  end
end
