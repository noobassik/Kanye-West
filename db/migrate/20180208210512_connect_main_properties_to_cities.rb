class ConnectMainPropertiesToCities < ActiveRecord::Migration[5.1]
  def change
    popular_countries = [458258, 6252001, 2635167, 3077311]
    ConnectPropertyToLocation.connect_property_by_country_ids(popular_countries)
  end
end
