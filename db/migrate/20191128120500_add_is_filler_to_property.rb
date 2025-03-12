class AddIsFillerToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :is_filler, :boolean, default: false

    Property.where('created_at < ?', DateTime.new(2019, 1, 1)).update_all(is_filler: true)
  end
end
