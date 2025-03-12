class AddTypeToSeoArticlesPage < ActiveRecord::Migration[5.2]
  def change
    add_column :seo_articles_pages, :type, :string

    SeoArticlesPage.where(page_type: 0).update_all(type: 'SeoArticlesIndexPage')
    SeoArticlesPage.where(page_type: 1).update_all(type: 'SeoArticlesLocationPage')
    SeoArticlesPage.where(page_type: 2).update_all(type: 'SeoArticlesCategoryPage')
    SeoArticlesPage.where(page_type: nil).update_all(type: 'SeoArticlesCategoryPage')

    remove_column :seo_articles_pages, :page_type
  end
end
