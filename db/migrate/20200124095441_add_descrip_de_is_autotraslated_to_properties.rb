class AddDescripDeIsAutotraslatedToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :autotranslated_description_de, :boolean, default: false
  end
end
