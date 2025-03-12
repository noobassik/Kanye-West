class AddOriginalRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :original_role, :integer
  end
end
