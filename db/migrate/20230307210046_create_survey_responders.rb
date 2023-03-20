class CreateSurveyResponders < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_responders, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :responder_answer, null: false
      t.references :survey, type: :uuid, null: false, foreign_key: true
      t.references :responder, type: :uuid, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
