class ChangeAttributesToNotNulInSurvey < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:surveys, :question, false)
  end
end
