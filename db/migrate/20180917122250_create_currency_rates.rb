class CreateCurrencyRates < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_rates do |t|
      t.string :abbrev
      t.float :rate
      t.date :date
    end
  end
end
