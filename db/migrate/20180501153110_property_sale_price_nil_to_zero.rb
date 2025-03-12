class PropertySalePriceNilToZero < ActiveRecord::Migration[5.1]
  def change
    change_column_default :properties, :sale_price_rub, 0
    change_column_default :properties, :sale_price_usd, 0
    change_column_default :properties, :sale_price_eur, 0

    count = Property.where(sale_price_eur: nil).count
    Property.where(sale_price_eur: nil).each_with_index do |property, index|
      p "--- #{index+1} of #{count}" if index % 100 == 0
      property.update_attribute(:sale_price_eur, 0)
    end

    # count = Property.where(sale_price_rub: nil).count
    # Property.where(sale_price_rub: nil).each_with_index do |property, index|
    #   p "--- #{index+1} of #{count}" if index % 100 == 0
    #   property.update_attribute(:sale_price_rub, 0)
    # end
    #
    # count = Property.where(sale_price_usd: nil).count
    # Property.where(sale_price_usd: nil).each_with_index do |property, index|
    #   p "--- #{index+1} of #{count}" if index % 100 == 0
    #   property.update_attribute(:sale_price_usd, 0)
    # end
  end
end
