class CreateContactSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.string :name
      t.string :email
      t.text :comments
      t.string :phone
      t.references :property, index: true

      t.timestamps
    end
  end
end
