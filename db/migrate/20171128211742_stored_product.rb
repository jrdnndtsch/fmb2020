class StoredProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :stored_products, :series_name, :string
    add_column :stored_products, :series_number, :string
  end
end
