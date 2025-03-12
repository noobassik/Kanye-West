class AddImageForLocation < ActiveRecord::Migration[5.1]
  def change
      add_column :countries, :image, :string
      add_column :regions, :image, :string
      add_column :cities, :image, :string
  end
end
