class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :type
      t.references :category, null: false, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
