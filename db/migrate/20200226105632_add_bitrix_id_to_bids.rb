class AddBitrixIdToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :bitrix_id, :integer
    add_column :agency_bids, :bitrix_id, :integer
    add_column :client_feedbacks, :bitrix_id, :integer
  end
end
