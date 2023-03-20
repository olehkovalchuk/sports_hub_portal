class FixColumnNameCommentsInArticles < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :comments, :comments_on
  end
end
