class ResizeImageForOtherObjects < ActiveRecord::Migration[5.2]
  def change
    cp_count = ContactPerson.count
    ContactPerson.all.each_with_index do |person, index|
      p "Update " + index.to_s + " person pictures of " + cp_count.to_s if index % 100 == 0
      if person.avatar.present? && person.avatar.file.exists?
        person.avatar.recreate_versions!
      end
    end

    c_count = City.where.not(image: nil).count
    City.where.not(image: nil).each_with_index do |city, index|
      p "Update " + index.to_s + " city pictures of " + c_count.to_s if index % 100 == 0
      if city.image.present? && city.image.file.exists?
        city.image.recreate_versions!
      end
    end

    r_count = Region.where.not(image: nil).count
    Region.where.not(image: nil).each_with_index do |region, index|
      p "Update " + index.to_s + " city pictures of " + r_count.to_s if index % 100 == 0
      if region.image.present? && region.image.file.exists?
        region.image.recreate_versions!
      end
    end

    country_count = Country.where.not(image: nil).count
    Country.where.not(image: nil).each_with_index do |country, index|
      p "Update " + index.to_s + " city pictures of " + country_count.to_s if index % 100 == 0
      if country.image.present? && country.image.file.exists?
        country.image.recreate_versions!
      end
    end
  end
end
