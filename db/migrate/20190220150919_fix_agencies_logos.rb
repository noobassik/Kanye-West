class FixAgenciesLogos < ActiveRecord::Migration[5.2]
  def change
    count_agencies = Agency.where.not(old_logo: [nil, '']).count

    Agency.where.not(old_logo: [nil, '']).each_with_index do |agency, index|
      p "--- Agency #{index + 1} of #{count_agencies}" if index % 20 == 0

      file_name = agency.old_logo.file.file.sub('old_logo', 'logo')
      if File.exist?(file_name)

        File.open(file_name) do |f|
          agency.logo = Picture.new(pic: f)
        end

        agency.save(validate: false)
      end
    end

    count_contact_people = ContactPerson.where.not(old_avatar: [nil, '']).count

    ContactPerson.where.not(old_avatar: [nil, '']).each_with_index do |contact_person, index|
      p "--- ContactPerson #{index + 1} of #{count_contact_people}" if index % 20 == 0

      file_name = contact_person.old_avatar.file.file.sub('old_avatar', 'avatar')
      if File.exist?(file_name)

        File.open(file_name) do |f|
          contact_person.avatar = Picture.new(pic: f)
        end

        contact_person.save(validate: false)
      end
    end
  end
end
