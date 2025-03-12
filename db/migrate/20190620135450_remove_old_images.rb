class RemoveOldImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :agencies, :old_logo
    remove_column :contact_people, :old_avatar
  end
end
