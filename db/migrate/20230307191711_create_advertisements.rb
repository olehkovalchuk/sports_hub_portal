class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :url, null: false
      t.string :type, default: "site_wide", null: false
      t.integer :status, default: 0, null: false
      t.references :category, type: :uuid, null: true, foreign_key: true
      t.references :author, type: :uuid, index: true, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
