class AddSyncFlagToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :client_feedbacks, :bitrix_synced, :integer, default: 0, null: false
    add_column :bids, :bitrix_synced, :integer, default: 0, null: false
    add_column :agency_bids, :bitrix_synced, :integer, default: 0, null: false
  end
end
