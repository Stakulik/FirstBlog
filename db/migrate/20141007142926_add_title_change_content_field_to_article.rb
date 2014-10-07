class AddTitleChangeContentFieldToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    change_column :articles, :content, :text
  end
end
