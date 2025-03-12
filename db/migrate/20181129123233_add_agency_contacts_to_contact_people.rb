class AddAgencyContactsToContactPeople < ActiveRecord::Migration[5.2]
  def change
    contact_person_count = ContactPerson.count
    ContactPerson.all.each_with_index do |cp, index|
      p "--- ContactPerson #{index + 1} of #{contact_person_count}" if index % 50 == 0

      cp.agency_contacts.where(value: ['', nil]).each do |ac|
        contact_hash = eval(ac.ctype)

        ac.update(ctype: contact_hash[:type], value: contact_hash[:value])
      end
    end
  end
end
