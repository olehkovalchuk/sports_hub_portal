class ChangeDefaultCommentsOnInArticles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :articles, :comments_on, true
  end
end
