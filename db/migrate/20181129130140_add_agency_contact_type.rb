class AddAgencyContactType < ActiveRecord::Migration[5.2]
  def change
    create_table :agency_contact_types do |t|
      t.string :title_ru
      t.string :title_en
    end

    add_reference :agency_contacts, :agency_contact_type, index: true

    agency_contact_count = AgencyContact.count
    AgencyContact.all.each_with_index do |agency_contact, index|
      p "--- Agency Contact #{index + 1} of #{agency_contact_count}" if index % 100 == 0

      act = AgencyContactType.find_or_create_by(title_ru: agency_contact.ctype)

      agency_contact.update(agency_contact_type_id: act.id)
    end

    change_column :agency_contacts, :agency_contact_type_id, :integer, null: false
    remove_column :agency_contacts, :ctype
  end
end
