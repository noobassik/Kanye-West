class LinkCapitalToCountry < ActiveRecord::Migration[5.1]
  def change
    rename_column :countries, :capital, :capital_name
    add_column :countries, :capital_id, :integer
  end
end
