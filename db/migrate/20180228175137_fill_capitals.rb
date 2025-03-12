class FillCapitals < ActiveRecord::Migration[5.1]
  def change
    Country.all.each do |country|
      capital = City.where(fcode: "PPLC").where("region_id IN (?)", country.regions.ids).first
      if capital.present?
        country.capital = capital
        country.save
      else
        capital = City.where("title_en LIKE '%#{country.capital_name}%'").where("region_id IN (?)", country.regions.ids).first if country.capital_name.present?
        if capital.present?
          country.capital = capital
          country.save
        else
          p "No capital for " + country.name + "(" + country.capital_name + ")"
        end
      end
    end

    remove_column :countries, :capital_name
  end
end
