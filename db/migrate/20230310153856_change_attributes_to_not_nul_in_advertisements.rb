class ChangeAttributesToNotNulInAdvertisements < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:advertisements, :status, false)
    change_column_null(:advertisements, :type, false)
    change_column_null(:advertisements, :url, false)
    change_column_null(:advertisements, :category_id, true)
  end
end
