class AddShowAgenciesOnWebsiteToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :show_agencies_on_website, :boolean, default: true
  end
end
