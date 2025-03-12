class RenameAgenciesLogos < ActiveRecord::Migration[5.2]
  def change
    rename_column :agencies, :logo, :old_logo
    rename_column :contact_people, :avatar, :old_avatar
  end
end
