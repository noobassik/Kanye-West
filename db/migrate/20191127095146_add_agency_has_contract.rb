class AddAgencyHasContract < ActiveRecord::Migration[5.2]
  def change
    rename_column :agencies, :priority, :has_contract
  end
end
