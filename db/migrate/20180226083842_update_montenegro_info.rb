class UpdateMontenegroInfo < ActiveRecord::Migration[5.1]
  def change
    Property.where(country_id: 8505033).update_all(country_id: 3194884)
    Country.delete(8505033)
  end
end
