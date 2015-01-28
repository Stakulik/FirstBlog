class AddSeoparamsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :header, :string
    add_column :articles, :seo_keywords, :string
    add_column :articles, :seo_description, :string
  end
end
