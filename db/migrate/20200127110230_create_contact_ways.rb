class CreateContactWays < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_ways do |t|
      t.integer :way_type, default: 0, null: false
      t.references :contact_wayable,
                   polymorphic: true,
                   index: {
                     name: 'contact_wayable'
                   }
    end
  end
end
