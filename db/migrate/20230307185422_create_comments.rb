class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :article, null: false, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.references :parent, index: true

      t.timestamps
    end
  end
end
