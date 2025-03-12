class RemoveExtraPriceFieldsFromProperty < ActiveRecord::Migration[5.2]
  def up
    rename_column :properties, :rent_price_eur_per_day,   :rent_price_per_day
    rename_column :properties, :rent_price_eur_per_month, :rent_price_per_month
    rename_column :properties, :rent_price_eur_per_week,  :rent_price_per_week
    rename_column :properties, :sale_price_eur,           :sale_price

    change_column :properties, :rent_price_unit_per_day,   :string
    change_column :properties, :rent_price_unit_per_month, :string
    change_column :properties, :rent_price_unit_per_week,  :string
    change_column :properties, :sale_price_unit,           :string

    Property.find_each do |property|
      if property.sale_price_usd.present? && property.sale_price_usd.positive?
        property.update_columns({
          sale_price:                property.sale_price_usd,
          sale_price_unit:           "USD",
          rent_price_unit_per_day:   "USD",
          rent_price_unit_per_month: "USD",
          rent_price_unit_per_week:  "USD"
        })
      elsif property.sale_price_rub.present? && property.sale_price_rub.positive?
        property.update_columns({
          sale_price:                property.sale_price_rub,
          sale_price_unit:           "RUB",
          rent_price_unit_per_day:   "RUB",
          rent_price_unit_per_month: "RUB",
          rent_price_unit_per_week:  "RUB"
        })
      else
        property.update_columns({
          sale_price_unit:           CurrencyRate::DEFAULT_CURRENCY,
          rent_price_unit_per_day:   CurrencyRate::DEFAULT_CURRENCY,
          rent_price_unit_per_month: CurrencyRate::DEFAULT_CURRENCY,
          rent_price_unit_per_week:  CurrencyRate::DEFAULT_CURRENCY
        })
      end
    end

    remove_column :properties, :rent_price_rub_per_day
    remove_column :properties, :rent_price_usd_per_day
    remove_column :properties, :rent_price_rub_per_month
    remove_column :properties, :rent_price_usd_per_month
    remove_column :properties, :rent_price_rub_per_week
    remove_column :properties, :rent_price_usd_per_week
    remove_column :properties, :sale_price_rub
    remove_column :properties, :sale_price_usd
  end
end
