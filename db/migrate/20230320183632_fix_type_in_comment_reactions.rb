class FixTypeInCommentReactions < ActiveRecord::Migration[7.0]
  def change
    rename_column :comment_reactions, :type, :reaction
  end
end
