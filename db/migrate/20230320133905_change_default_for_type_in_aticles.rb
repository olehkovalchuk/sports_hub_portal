class ChangeDefaultForTypeInAticles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :articles, :type, 0
  end
end
