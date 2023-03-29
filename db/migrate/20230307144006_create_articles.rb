class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :name, null: false
      t.string :caption, null: false
      t.text :content, null: false
      t.string :picture_text, null: false
      t.string :location
      t.boolean :main_page, default: true, null: false
      t.boolean :comments_on, default: true, null: false
      t.integer :status, default: 0
      t.integer :article_type, default: 0, null: false
      t.string :url_data
      t.text :file_data
      t.references :category, type: :uuid, foreign_key: true
      t.references :team, type: :uuid, foreign_key: true
      t.references :author, type: :uuid, index: true, null: false, foreign_key: { to_table: :users }
      

      t.timestamps
    end
  end
end
