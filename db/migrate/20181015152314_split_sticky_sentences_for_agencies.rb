class SplitStickySentencesForAgencies < ActiveRecord::Migration[5.2]
  def change
    regex_for_description = /(\w\.)(\w)/

    agencies_count = Agency.where('about_ru IS NOT NULL OR about_en IS NOT NULL').count
    Agency.where('about_ru IS NOT NULL OR about_en IS NOT NULL').each_with_index do |agency, index|
      p "Update " + index.to_s + " property of " + agencies_count.to_s if index % 100 == 0

      if agency.about_ru.match?(regex_for_description) || agency.about_en.match?(regex_for_description)
        agency.about_ru.gsub!(regex_for_description, '\1 \2')
        agency.about_en.gsub!(regex_for_description, '\1 \2')
        agency.save
      end
    end
  end
end
