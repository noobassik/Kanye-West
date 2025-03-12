class CreatePropertySupertypes < ActiveRecord::Migration[5.1]
  def change
    create_table :property_supertypes do |t|
      t.string :title_ru
      t.string :title_en
    end

    add_reference :property_types, :property_supertype, index: true
  end
end
