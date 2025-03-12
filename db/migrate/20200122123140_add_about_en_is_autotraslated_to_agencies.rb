class AddAboutEnIsAutotraslatedToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :autotranslated_about_en, :boolean, default: false
  end
end
