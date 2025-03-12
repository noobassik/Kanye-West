class RenameUrlToSlug < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :url, :slug
    rename_column :article_categories, :url, :slug
    rename_column :agencies, :url, :slug
    rename_column :countries, :url, :slug
    rename_column :regions, :url, :slug
    rename_column :cities, :url, :slug
  end
end
