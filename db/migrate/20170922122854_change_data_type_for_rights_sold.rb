class ChangeDataTypeForRightsSold < ActiveRecord::Migration[5.0]
  def up
    change_column :stored_products, :rights_sold, :string
  end

  def down
    change_column :stored_products, :rights_sold, :boolean, default: false
  end
end
