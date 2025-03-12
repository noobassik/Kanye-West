class AddIndexToHsUrl < ActiveRecord::Migration[5.1]
  def change
    add_index :properties, :hs_link, unique: true
  end
end
