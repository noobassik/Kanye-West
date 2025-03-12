class AddParsedToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :parsed, :boolean, default: false, null: false
  end
end
