class ChangeAttributesToNotNulInArticles < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:articles, :name, false)
    change_column_null(:articles, :caption, false)
    change_column_null(:articles, :comments, false)
    change_column_null(:articles, :content, false)
    change_column_null(:articles, :type, false)
    change_column_null(:articles, :picture_text, false)
    change_column_null(:articles, :main_page, false)
    change_column_null(:articles, :author_id, false)
  end
end
