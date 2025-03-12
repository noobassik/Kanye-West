class AddEnergyEfficiencyTypeToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :energy_efficiency_type, :integer
  end
end
