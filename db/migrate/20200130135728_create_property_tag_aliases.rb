class CreatePropertyTagAliases < ActiveRecord::Migration[5.2]
  def change
    create_table :property_tag_aliases do |t|
      t.string :name, null: false
      t.references :property_tag, null: false
    end

    add_index :property_tag_aliases, :name, unique: true
  end
end
