class FixColumnNameInArticles < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :type, :article_type
  end
end
