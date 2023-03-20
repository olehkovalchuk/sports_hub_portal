class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :name, null: false
      t.string :location, default: "all"
      t.references :category, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
