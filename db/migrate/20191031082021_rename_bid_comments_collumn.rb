class RenameBidCommentsCollumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :bids, :comments, :message
    rename_column :agency_bids, :comments, :message
    rename_column :client_feedbacks, :comments, :message
  end
end
