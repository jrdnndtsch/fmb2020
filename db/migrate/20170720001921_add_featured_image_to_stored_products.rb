class AddFeaturedImageToStoredProducts < ActiveRecord::Migration[5.0]
  def up
    add_attachment :stored_products, :featured_image
  end

  def down
    remove_attachment :stored_products, :featured_image
  end
end
