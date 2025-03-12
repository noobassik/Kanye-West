class DeleteCitiesWithoutRegion < ActiveRecord::Migration[5.1]
  def change
    City.where(region_id: nil).delete_all
    remove_column :cities, :country_id
  end
end
