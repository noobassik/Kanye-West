class RenameAgencyContactsToContacts < ActiveRecord::Migration[5.2]
  def change
    rename_table :agency_contacts, :contacts
    rename_table :agency_contact_types, :contact_types

    rename_column :contacts, :agency_contact_type_id, :contact_type_id
  end
end
