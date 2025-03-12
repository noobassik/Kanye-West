class AddMontenegroCountry < ActiveRecord::Migration[5.1]
  def change
    montenegro = Country.new
    montenegro.id = 8505033
    montenegro.title_ru = "Черногория"
    montenegro.title_en = "Montenergo and Serbia"
    montenegro.save
    Country.update_counters montenegro.id, properties_count: montenegro.properties.length
  end
end
