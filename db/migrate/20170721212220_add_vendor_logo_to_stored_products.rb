class AddVendorLogoToStoredProducts < ActiveRecord::Migration[5.0]
 def up
   add_attachment :stored_products, :vendor_logo
 end

 def down
   remove_attachment :stored_products, :vendor_logo
 end
end
