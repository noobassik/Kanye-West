class AddIsModifiedForProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :moderated, :boolean, default: false
  end
end
