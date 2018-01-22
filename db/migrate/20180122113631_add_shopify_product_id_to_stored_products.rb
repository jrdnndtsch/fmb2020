class AddShopifyProductIdToStoredProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :stored_products, :shopify_product_id, :string
  end
end
