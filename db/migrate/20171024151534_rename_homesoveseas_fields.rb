class RenameHomesoveseasFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :agencies, :homesoverseas_link, :hs_link
    rename_column :agencies, :homesoverseas_properties_links, :hs_properties_links

    add_column :properties, :hs_link, :string
  end
end
