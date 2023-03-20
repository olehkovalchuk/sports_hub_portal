class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :name, null: false
      t.references :parent, type: :uuid, index: true, default: nil, null: true

      t.timestamps
    end
  end
end
