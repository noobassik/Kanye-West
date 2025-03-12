class AddIconToMessengerType < ActiveRecord::Migration[5.2]
  def change
    add_column :messenger_types, :icon_class, :string, default: '', null: false
  end
end
