class AddAboutDeIsAutotraslatedToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :autotranslated_about_de, :boolean, default: false
  end
end
