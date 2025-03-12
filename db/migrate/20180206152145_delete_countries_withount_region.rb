class DeleteCountriesWithountRegion < ActiveRecord::Migration[5.1]
  def change
    Country.all.each do |country|
      if country.regions.count == 0
        p "Delete " + country.title_en
        Country.delete(country)
      end
    end
  end
end
