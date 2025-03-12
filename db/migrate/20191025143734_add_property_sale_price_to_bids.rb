class AddPropertySalePriceToBids < ActiveRecord::Migration[5.2]
  def change
    add_column :bids, :sale_price, :integer
    add_column :bids, :sale_price_unit, :string
    add_column :bids, :price_on_request, :boolean

    Bid.all.each do |bid|
      bid.update(sale_price: bid.property.sale_price,
                 sale_price_unit: bid.property.sale_price_unit,
                 price_on_request: bid.property.price_on_request)
    end
  end
end
