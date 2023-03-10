class ChangeCategoryIdToNotNulInComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:comments, :text, false)
    change_column_null(:comments, :author_id, false)
  end
end
