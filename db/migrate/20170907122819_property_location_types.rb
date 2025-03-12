class PropertyLocationTypes < ActiveRecord::Migration[5.1]
  def up
    remove_index :properties, name: :index_properties_on_location_type_id
    remove_column :properties, :location_type_id

    create_table :location_types_properties, id: false do |t|
      t.belongs_to :property, index: true
      t.belongs_to :location_type, index: true
    end
  end

  def down
    drop_table :location_types_properties

    add_column :properties, :location_type_id, :bigint
    add_index :properties, :location_type_id
  end
end
