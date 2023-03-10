class ChangeCategoryIdToNotNulInBaners < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:baners, :category_id, false)
  end
end
