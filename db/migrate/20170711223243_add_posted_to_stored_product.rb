class AddPostedToStoredProduct < ActiveRecord::Migration[5.0]
  def change
  	add_column :stored_products, :posted, :boolean, :default => false
  end
end
