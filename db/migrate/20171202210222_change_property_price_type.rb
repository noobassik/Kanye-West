class ChangePropertyPriceType < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :sale_price_rub1, :bigint
    add_column :properties, :sale_price_usd1, :bigint
    add_column :properties, :sale_price_eur1, :bigint

    property_count = Property.count

    Property.all.each_with_index do |property, index|
      p "Property #{index + 1} of #{property_count}" unless index % 100
      property.sale_price_rub1 = property.sale_price_rub
      property.sale_price_usd1 = property.sale_price_usd
      property.sale_price_eur1 = property.sale_price_eur
      property.save
    end


    remove_column :properties, :sale_price_rub
    remove_column :properties, :sale_price_usd
    remove_column :properties, :sale_price_eur

    rename_column :properties, :sale_price_rub1, :sale_price_rub
    rename_column :properties, :sale_price_usd1, :sale_price_usd
    rename_column :properties, :sale_price_eur1, :sale_price_eur
  end
end
