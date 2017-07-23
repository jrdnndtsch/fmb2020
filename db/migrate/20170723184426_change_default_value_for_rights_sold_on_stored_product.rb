class ChangeDefaultValueForRightsSoldOnStoredProduct < ActiveRecord::Migration[5.0]
  def up
    change_column :stored_products, :rights_sold, :boolean, default: false
  end

  def down
    change_column :stored_products, :rights_sold, :boolean, default: true
  end
end
