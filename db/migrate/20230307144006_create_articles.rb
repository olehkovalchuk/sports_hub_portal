class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :caption
      t.text :content
      t.string :picture_text
      t.string :location
      t.boolean :main_page, default: true
      t.boolean :comments, default: true
      t.string :type, default: "article"
      t.string :url_data
      t.text :file_data
      t.references :category, foreign_key: true
      t.references :team, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }
      

      t.timestamps
    end
  end
end
