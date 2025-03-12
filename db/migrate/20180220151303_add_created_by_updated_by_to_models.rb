class AddCreatedByUpdatedByToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :created_by, :integer
    add_column :countries, :updated_by, :integer

    add_column :regions, :created_by, :integer
    add_column :regions, :updated_by, :integer

    add_column :cities, :created_by, :integer
    add_column :cities, :updated_by, :integer

    add_column :agencies, :created_by, :integer
    add_column :agencies, :updated_by, :integer

    add_column :properties, :created_by, :integer
    add_column :properties, :updated_by, :integer
  end
end
