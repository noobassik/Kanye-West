class AddDescripEnIsAutoTranslatedToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :autotranslated_description_en, :boolean,  default: false
  end
end
