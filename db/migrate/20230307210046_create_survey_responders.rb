class CreateSurveyResponders < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_responders do |t|
      t.string :responder_answer
      t.references :survey, null: false, foreign_key: true
      t.references :responder, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
