class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :type, null: false
      t.references :category, type: :uuid, null: true, foreign_key: true
      t.references :team, type: :uuid, null: true, foreign_key: true

      t.timestamps
    end
  end
end
