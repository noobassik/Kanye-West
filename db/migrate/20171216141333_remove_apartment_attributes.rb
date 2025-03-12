class RemoveApartmentAttributes < ActiveRecord::Migration[5.1]
  def up
    drop_table :apartment_attributes
  end

  def down
    create_table :apartment_attributes do |t|
      t.belongs_to :property, index: true
    end
  end
end
