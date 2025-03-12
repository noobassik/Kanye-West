class AddIsActiveToPropertyAndAgency < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :is_active, :boolean, default: false
    add_column :agencies, :is_active, :boolean, default: false

    Property.all.each do |property|
      property.update_attribute(:is_active, true)
    end

    Agency.all.each do |agency|
      agency.update_attribute(:is_active, true)
    end
  end
end
