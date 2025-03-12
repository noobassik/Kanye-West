class AddContactSendToBid < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :contacts_sent, :boolean, default: false
  end
end
