class AddModileToBid < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :mobile, :boolean, default: false
  end
end
