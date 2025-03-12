class TakeMorePropertiesTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :in_credit, :boolean, default: false
    add_column :properties, :in_mortgage, :boolean, default: false
  end
end
