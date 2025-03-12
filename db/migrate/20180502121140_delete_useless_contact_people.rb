class DeleteUselessContactPeople < ActiveRecord::Migration[5.1]
  def change
    ContactPerson.where(name_ru: [nil, ''], name_en: [nil, '']).destroy_all

    count = ContactPerson.where(name_ru: [nil, '']).count
    ContactPerson.where(name_ru: [nil, '']).each_with_index do |cp, index|
      p "--- #{index+1} of #{count}" if index % 100 == 0
      cp.destroy if cp.agency.contact_people.count > 1
    end
  end
end
