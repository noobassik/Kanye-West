class AddFilterShowColumnToPropertyTag < ActiveRecord::Migration[5.2]
  def change
    add_column :property_tags, :show_in_filter, :boolean, default: false, null: false
  end
end
