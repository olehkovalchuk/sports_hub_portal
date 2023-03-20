class CreateBaners < ActiveRecord::Migration[7.0]
  def change
    create_table :baners, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :name, null: false
      t.string :content, null: false
      t.integer :status, default: 0, null: false
      t.references :category, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
