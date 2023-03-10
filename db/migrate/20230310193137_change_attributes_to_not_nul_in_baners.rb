class ChangeAttributesToNotNulInBaners < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:baners, :status, false)
    change_column_null(:baners, :name, false)
    change_column_null(:baners, :content, false)
  end
end
