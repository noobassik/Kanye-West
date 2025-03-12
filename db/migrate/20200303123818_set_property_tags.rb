class SetPropertyTags < ActiveRecord::Migration[5.2]
  def change
    PropertyTag.all.each.with_index(1) do |tag, index|
      tag.update_column :position, index
    end
  end
end
