class ChangeAttributesToNotNulInSurveyResponders < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:survey_responders, :responder_answer, false)
  end
end
