class ConnectMontenegroProperties < ActiveRecord::Migration[5.1]
  def change
    ConnectPropertyToLocation.connect_property_by_country_ids(3194884)
  end
end
