class AddIndexToPrianUrl < ActiveRecord::Migration[5.1]
  def change
    add_index :properties, :prian_link, unique: true
  end
end
