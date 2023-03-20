class CreateCommentReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_reactions, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.integer :type, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :comment, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
