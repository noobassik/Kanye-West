class RenameUndeletableForSeoTemplate < ActiveRecord::Migration[5.2]
  def change
    rename_column :seo_templates, :undeletable, :is_main
  end
end
