class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.date :due_date
      t.string :question, null: false
      t.integer :status, default: 0, null: false
      t.references :author, type: :uuid, null: false, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
