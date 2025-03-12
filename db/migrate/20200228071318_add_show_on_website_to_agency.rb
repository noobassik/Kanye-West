class AddShowOnWebsiteToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :show_on_website, :boolean, default: true
  end
end
