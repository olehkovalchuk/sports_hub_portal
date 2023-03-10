class ChangeAttributesToNotNulInSubscription < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:subscriptions, :type, false)
    change_column_null(:subscriptions, :team_id, true)
    change_column_null(:subscriptions, :category_id, true)
  end
end
