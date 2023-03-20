class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :text, null: false
      t.references :survey, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
