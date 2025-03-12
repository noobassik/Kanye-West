class FillCitiesRegionsCountries < ActiveRecord::Migration[5.1]
  def change
    AreasFiller.fill_geonames
  end
end
