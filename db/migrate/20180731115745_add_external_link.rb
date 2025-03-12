class AddExternalLink < ActiveRecord::Migration[5.1]
  def change
    rename_column :properties, :hs_link, :external_link

    Property.where(external_link: nil).update_all("external_link = prian_link")

    remove_column :properties, :prian_link
  end
end
