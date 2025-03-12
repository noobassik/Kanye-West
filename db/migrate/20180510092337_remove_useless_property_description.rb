class RemoveUselessPropertyDescription < ActiveRecord::Migration[5.1]
  def change
    Property.where("description_ru LIKE '%View original text%' OR description_en LIKE '%View original text%'")
        .update_all(description_ru: '', description_en: '')
  end
end
