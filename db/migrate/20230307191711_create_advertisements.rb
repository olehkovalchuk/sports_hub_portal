class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.string :url
      t.string :type, default: "site_wide"
      t.string :status, default: "inactive"
      t.references :category, null: false, foreign_key: true
      t.references :author, index: true, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
