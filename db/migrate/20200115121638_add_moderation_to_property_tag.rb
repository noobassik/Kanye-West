class AddModerationToPropertyTag < ActiveRecord::Migration[5.2]
  def change
    add_column :property_tags, :moderated, :boolean, default: false, null: false
    PropertyTag.all.update_all(moderated: true)
  end
end
