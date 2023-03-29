class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.text :text, null: false
      t.references :article, type: :uuid, null: false, foreign_key: true
      t.references :author, type: :uuid, index: true, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
