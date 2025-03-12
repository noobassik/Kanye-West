class DeleteTypeFromProperty < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :type
  end
end
