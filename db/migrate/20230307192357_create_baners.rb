class CreateBaners < ActiveRecord::Migration[7.0]
  def change
    create_table :baners do |t|
      t.string :name
      t.string :content
      t.string :status, default: "not_published"
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
