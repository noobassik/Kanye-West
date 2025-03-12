class AddPositionToPropertyTagsItem < ActiveRecord::Migration[5.2]
  def change
    add_column :property_tags, :position, :integer
  end
end
