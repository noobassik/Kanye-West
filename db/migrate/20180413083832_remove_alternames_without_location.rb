class RemoveAlternamesWithoutLocation < ActiveRecord::Migration[5.1]
  def change
    id_set = Set.new
    id_set.merge(Country.ids)
    id_set.merge(Region.ids)
    id_set.merge(City.ids)
    id_set = AlternateName.pluck(:geoname_id).to_set - id_set
    arr_id= []
    id_set.to_a.each_with_index do |id, index|
      arr_id << id
      if index % 5000 == 0
        p "--- AlternateName #{index + 1} of #{id_set.count} in #{Time.now.to_s}" if index % 5000 == 0
        AlternateName.where(geoname_id: arr_id).delete_all
        arr_id.clear
      end
    end
    AlternateName.where(geoname_id: arr_id).delete_all
  end
end
