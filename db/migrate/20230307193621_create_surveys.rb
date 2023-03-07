class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.date :due_date
      t.string :question
      t.string :status, default: "not_published"
      t.references :author, null: false, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
