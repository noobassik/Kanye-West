class CreateAgencyBids < ActiveRecord::Migration[5.2]
  def change
    create_table :agency_bids do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :agency_name, null: false
      t.string :website
      t.belongs_to :country, foreign_key: true
      t.string :comments, null: false

      t.timestamps
    end
  end
end
