class ChangeTitleRuForLocations < ActiveRecord::Migration[5.1]
  def change
    change_column :countries, :title_ru, :string, :limit => 200, :default => ""
    change_column :cities, :title_ru, :string, :limit => 200, :default => ""
    change_column :regions, :title_ru, :string, :limit => 200, :default => ""
  end
end
