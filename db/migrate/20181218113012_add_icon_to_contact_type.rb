class AddIconToContactType < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_types, :icon_class, :string, default: '', null: false
  end
end
