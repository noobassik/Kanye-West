class RemovePplCitiesWithoutProperty < ActiveRecord::Migration[5.1]
  def change
    City.where("fcode = 'PPL' AND properties_count = 0").delete_all
  end
end
