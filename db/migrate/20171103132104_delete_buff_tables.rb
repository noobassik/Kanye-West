class DeleteBuffTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :regions, :admin1
  end
end
