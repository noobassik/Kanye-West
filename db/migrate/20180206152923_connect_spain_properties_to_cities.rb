class ConnectSpainPropertiesToCities < ActiveRecord::Migration[5.1]
  def change
    main_countries = [2510769]
    ConnectPropertyToLocation.connect_property_by_country_ids(main_countries)
  end
end
