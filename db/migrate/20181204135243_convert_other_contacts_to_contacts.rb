class ConvertOtherContactsToContacts < ActiveRecord::Migration[5.2]
  def change
    count = AgencyOtherContact.where(title_ru: ["Телефон компании:", "Телефон 2 компании:", "Телефон 3 компании:", "E-mail:", "Skype:"]).count
    AgencyOtherContact.where(title_ru:
                                 ["Телефон компании:", "Телефон 2 компании:",
                                  "Телефон 3 компании:", "E-mail:", "Skype:"]).each_with_index do |aoc, index|
      p "--- AgencyOtherContact #{index + 1} of #{count}" if index % 50 == 0

      case aoc.title_ru
        when "Телефон компании:", "Телефон 2 компании:", "Телефон 3 компании:"
          aoc.content_ru.each do |aocc|
            phone = aocc.scan(/(?<=<a>).*(?=<\/a>)/)[0]
            if phone.present?
              AgencyContact.create!(value: phone, agency_contact_type_id: 7, contactable_id: aoc.agency_id, contactable_type: "Agency")
            end
          end
        when "E-mail:"
          aoc.content_ru.each do |aocc|
            email = aocc.scan(/(?<=mailto:).*(?=\\">\w)/)[0]
            if email.present?
              AgencyContact.create!(value: email, agency_contact_type_id: 9, contactable_id: aoc.agency_id, contactable_type: "Agency")
            end
          end
        when "Skype:"
          aoc.content_ru.each do |aocc|
            AgencyContact.create!(value: aocc, agency_contact_type_id: 4, contactable_id: aoc.agency_id, contactable_type: "Agency")
          end
      end
    end
  end
end
