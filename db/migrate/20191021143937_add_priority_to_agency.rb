class AddPriorityToAgency < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :priority, :boolean, default: false
  end
end
