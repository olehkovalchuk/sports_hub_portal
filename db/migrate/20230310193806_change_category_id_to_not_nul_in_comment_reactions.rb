class ChangeCategoryIdToNotNulInCommentReactions < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:comment_reactions, :type, false)
  end
end
